class TaggingsController < ApplicationController
    respond_to :json
    # GET /troubles or /troubles.json
    def index
      taggings = Tagging.all
  end
end
  