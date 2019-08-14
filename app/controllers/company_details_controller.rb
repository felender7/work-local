class CompanyDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company_detail, only: [:profile,:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :current_user_company_details, only:[:show]
  #before_action :check_current_profile, except:[:profile]

  # GET /company_details
  # GET /company_details.json
  def index
    @company_details = CompanyDetail.all
  end

  # GET /company_details/1
  # GET /company_details/1.json
  def show
    @jobs = Job.where(company_detail_id: @company_detail.id).paginate(:page => params[:page], :per_page => 3).order("created_at DESC")
    @jobs_count_profile = Job.where(company_detail_id: @company_detail.id).count
  end

  # GET /company_details/new
  def new
    @company_detail = current_user.company_details.build
  end

  # GET /company_details/1/edit
  def edit
  end

  # POST /company_details
  # POST /company_details.json
  def create
    @company_detail = current_user.company_details.build(company_detail_params)
    respond_to do |format|
      if @company_detail.save
        format.html { redirect_to @company_detail, notice: 'Company detail was successfully created.' }
        format.json { render :show, status: :created, location: @company_detail }
      else
        format.html { render :new }
        format.json { render json: @company_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_details/1
  # PATCH/PUT /company_details/1.json
  def update
    respond_to do |format|
      if @company_detail.update(company_detail_params)
        format.html { redirect_to @company_detail, notice: 'Company detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_detail }
      else
        format.html { render :edit }
        format.json { render json: @company_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_details/1
  # DELETE /company_details/1.json
  def destroy
    @company_detail.destroy
    respond_to do |format|
      format.html { redirect_to company_details_url, notice: 'Company detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_detail
      @company_detail = CompanyDetail.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_detail_params
      params.require(:company_detail).permit(:company_name, :description,:email, :registration, :tel, :industry, :company_logo,:ck,:bee, :user_id)
    end

    # check if the user is authorised to edit,update or destroy the cv
    def correct_user
      @company_detail = current_user.company_details.find_by(params[:friendly])
          redirect_to company_details_path, notice: "Not authorised to edit" if @company_detail.nil?
    end
    # check if  cv belongs to the correct user - current user
      def current_user_company_details
        if user_signed_in?
          @company_details = current_user.company_details.order("created_at DESC")
       end
     end

     # check if  the current user login in can view the page
     #def check_current_profile
        #if user_signed_in?
          #if current_user.profile_type == "Individual"
            #redirect_to root_path , notice:"Not authorised to view this page"
          #end
        #end
     #end
end
