class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    users = User.all
    params[:tag] ? @users = User.tagged_with(params[:tag]) : @users = User.all
    if users
      render json: {status: "SUCCESS", message: "All users ready", data: users}, status: :ok
    else
      render json: users.errors, status: :bad_request
    end

    # online = User.all.find_by_jti(params[:jti])
  end
  def show
    @user = User.find(params[:id])
    params[:tag] ? @users = User.tagged_with(params[:tag]) : @users = User.all
    render json: {status: "SUCCESS", message: "All users ready", data: @user.tags, status: :ok }
  end

  helper_method :current_user


  def update
    respond_to do |format|
      if @user.update(user_params)
        format.json { render :show, status: :ok, location: @user, notice: "User was successfully updated."  }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head :no_content, status: :ok
  end

  def user_param
    params.require(:user).permit(:name, :subjects, :trouble_id, :image, :gender, :avatar, :email, :isadmin, :description, :tag_list, :tagging, :tag, { tag_ids: [] }, :tag_ids)
  end

end
