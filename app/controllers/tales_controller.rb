class TalesController < ApplicationController
  before_action :set_tale, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user!, except: [:index, :show]
  before_action :authenticate_user!
  before_action :owned_tale, only: [:edit, :update, :destroy]  

  # GET /tales
  # GET /tales.json
  def index
    @tales = Tale.order(created_at: :desc)
  end

  # GET /tales/1
  # GET /tales/1.json
  def show
  end

  # GET /tales/new
  def new
    @tale = Tale.new
  end

  # GET /tales/1/edit
  def edit
  end

  # POST /tales
  # POST /tales.json
  def create
    @tale = current_user.tale.build(tale_params)
    respond_to do |format|
      if @tale.save
        format.html { redirect_to @tale, notice: 'Tale was successfully created.' }
        format.json { render :show, status: :created, location: @tale }
      else
        format.html { render :new }
        format.json { render json: @tale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tales/1
  # PATCH/PUT /tales/1.json
  def update
    respond_to do |format|
      if @tale.update(tale_params)
        format.html { redirect_to @tale, notice: 'Tale was successfully updated.' }
        format.json { render :show, status: :ok, location: @tale }
      else
        format.html { render :edit }
        format.json { render json: @tale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tales/1
  # DELETE /tales/1.json
  def destroy
    @tale.destroy
    respond_to do |format|
      format.html { redirect_to tales_url, notice: 'Tale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tale
      @tale = Tale.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tale_params
      params.require(:tale).permit(:content)
    end
    def owned_tale 
      unless current_user && current_user == @tale.user || current_user && current_user.admin? 
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
end  
end
