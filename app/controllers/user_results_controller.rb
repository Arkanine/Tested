class UserResultsController < ApplicationController
  before_action :set_user_result, only: [:show, :edit, :update, :destroy]

  # GET /user_results
  # GET /user_results.json
  def index
    @user_results = UserResult.all
  end

  # GET /user_results/1
  # GET /user_results/1.json
  def show
  end

  # GET /user_results/new
  def new
    @user_result = UserResult.new
  end

  # GET /user_results/1/edit
  def edit
    @user_results = UserResult.all
    @tests = Test.all
  end

  # POST /user_results
  # POST /user_results.json
  def create
    @user_result = UserResult.new(user_result_params)

    respond_to do |format|
      if @user_result.save
        format.html { redirect_to @user_result, notice: 'User result was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_result }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_results/1
  # PATCH/PUT /user_results/1.json
  def update
      if @user_result.update(user_result_params)
        redirect_to :back
      else
        render action: 'edit'
      end

  end

  # DELETE /user_results/1
  # DELETE /user_results/1.json
  def destroy
    @user_result.destroy
    respond_to do |format|
      format.html { redirect_to user_results_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_result
      @user_result = UserResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_result_params
      params.require(:user_result).permit(:user_id, :test_id, :score, questions_attributes: [:id, :name])
    end
end
