class TroublesController < ApplicationController
  before_action :set_trouble, only: %i[ show edit update destroy ]
  respond_to :json
  # GET /troubles or /troubles.json
  def index
    troubles = Trouble.all
    if troubles
      render json: {status: "SUCCESS", message: "All users ready", data: troubles}, status: :ok
    else
      render json: troubles.errors, status: :bad_request
    end

    # online = User.all.find_by_jti(params[:jti])
  end

  # GET /troubles/1 or /troubles/1.json
  def show
  end

  # GET /troubles/new
  def new
    @trouble = Trouble.new
  end

  # GET /troubles/1/edit
  def edit
  end

  # POST /troubles or /troubles.json
  def create
    @trouble = Trouble.new(trouble_params)

    respond_to do |format|
      if @trouble.save
        format.html { redirect_to admin_problems_url  }
        format.json { render :show, status: :created, location: @trouble }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trouble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /troubles/1 or /troubles/1.json
  def update
    respond_to do |format|
      if @trouble.update(trouble_params)
        format.html { redirect_to admin_problems_url }
        format.json { render :show, status: :ok, location: @trouble }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trouble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /troubles/1 or /troubles/1.json
  def destroy
    @trouble.destroy

    respond_to do |format|
      format.html { redirect_to admin_problems_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trouble
      @trouble = Trouble.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trouble_params
      params.require(:trouble).permit(:name, :display_in_navbar)
    end
end
