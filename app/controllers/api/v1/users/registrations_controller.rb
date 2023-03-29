class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

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
  
  def create
    user = User.new(sign_up_params)
    if user.save
      render json: {user: user, message: 'sign up success', is_success: true}, status: :ok
    else
      render json: {message: 'Sign up failed', is_success: false}, status: :unprocessable_entity
    end
  end
  def update
   
      if @user.update(sign_up_params)
        render json: { user: @user, message: "User was successfully updated." , is_success: true }, status: :ok
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
  end
  private

  def sign_up_params
    params.require(:user).permit(:email, :avatar, :subject, :image, :trouble_id, :gender,  :username, :password, :password_confirmation, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end

end
