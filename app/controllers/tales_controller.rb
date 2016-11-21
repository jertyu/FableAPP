class TalesController < ApplicationController
  before_action :set_tale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #All index#action require current_user
  before_action :owned_tale, only: [:edit, :update, :destroy] #Denies access to :edit,:update,:destroy unless fit condition

  # GET
  def index #Root
    @tales = Tale.order(created_at: :desc) #Tales#Index @tales in DESCENDING order
  end
  # GET
  def show #/tales/:id
    #Tales#Show empty action for append tale
  end
  # GET
  def new #/tales/new
    @tale = Tale.new 
  end

  # GET
  def edit #/tales/:id/edit
  end

  # POST
  def create
    @tale = current_user.tale.build(tale_params) #Sets new tale to current_user.tale
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

  # PATCH / PUT
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

  # DELETE
  def destroy
    @tale.destroy
    respond_to do |format|
      format.html { redirect_to tales_url, notice: 'Tale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_tale #set tale value
      @tale = Tale.find(params[:id]) #tale=tale.id

    end

    def tale_params #set tale params
      params.require(:tale).permit(:content) #Only content atm. Will have categories, and may have titles. 
    end
    def owned_tale #tale auth
      unless current_user && current_user == @tale.user || current_user && current_user.admin?#current_user=@tale.user or current_user.admin?
      flash[:alert] = "Access denied" #flash msg
      redirect_to root_path #redirect
    end
end  
end
