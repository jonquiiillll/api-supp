class User < ApplicationRecord

  has_many :taggings
  has_many :tags, through: :taggings
  has_many :messages

  def self.tagged_with(name)
    Tag.find_by!(name: name).users
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
 
  mount_uploader :image, ImageUploader
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, :recoverable, :rememberable, jwt_revocation_strategy: self    
         after_create_commit { broadcast_append_to "users" }       
end
