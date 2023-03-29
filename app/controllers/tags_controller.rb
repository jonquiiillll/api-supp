class TagsController < ApplicationController

    respond_to :json
    # GET /troubles or /troubles.json
  def index
    tags = Tag.all
    if tags
      render json: {status: "SUCCESS", message: "All tags ready", data: tags}, status: :ok
    else
      render json: tags.errors, status: :bad_request
    end
  end
end
