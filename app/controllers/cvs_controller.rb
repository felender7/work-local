class CvsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_cv, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :current_user_cvs, only:[:show]
  before_action :check_current_profile


  # GET /cvs
  # GET /cvs.json
  def index
    @cvs = Cv.all
  end

  # GET /cvs/1
  # GET /cvs/1.json
  def show
  end

  # GET /cvs/new
  def new
    @cv = current_user.cvs.build
  end

  # GET /cvs/1/edit
  def edit
  end

  # POST /cvs
  # POST /cvs.json
  def create
    @cv = current_user.cvs.build(cv_params)
    respond_to do |format|
      if @cv.save
        format.html { redirect_to @cv, notice: 'Cv was successfully created.' }
        format.json { render :show, status: :created, location: @cv }
      else
        format.html { render :new }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cvs/1
  # PATCH/PUT /cvs/1.json
  def update
    respond_to do |format|
      if @cv.update(cv_params)
        format.html { redirect_to @cv, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @cv }
      else
        format.html { render :edit }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cvs/1
  # DELETE /cvs/1.json
  def destroy
    @cv.destroy
    respond_to do |format|
      format.html { redirect_to cvs_url, notice: 'Cv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cv
      @cv = Cv.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cv_params
      params.require(:cv).permit(:phone, :identification_type,:user_id,:id_passport,:gender, :ethnicity ,:date_of_birth, :place_of_birth,:disability, :education_type, :avatar,:job_function, :job_industry, :availability, :salary_range, :facebook ,:twitter,:linked_in, referrals_attributes: [:id, :institution, :contact_person,:position,:contact_numbers, :_destroy])
    end
    # check if the user is authorised to edit,update or destroy the cv
    def correct_user
      @cv = current_user.cvs.find_by(params[:friendly])
          redirect_to cvs_path, notice: "Not authorised to edit this resume" if @cv.nil?
    end
    # check if  cv belongs to the correct user - current user
      def current_user_cvs
        if user_signed_in?
          @cvs = current_user.cvs.order("created_at DESC")
       end
     end

     # check if  the current user login in can view the page
       def check_current_profile
          if user_signed_in?
            if current_user.profile_type == "Business"
              redirect_to root_path , notice:"Not authorised to view this page"
            end
          end
       end
end
