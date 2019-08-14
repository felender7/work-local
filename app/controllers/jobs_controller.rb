class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :current_user_jobs, only:[:show]
  before_action :check_current_profile, only:[:index, :new]



  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all.order("created_at DESC")
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    display_user_content
  end

  # GET /jobs/new
  def new
    @job = current_user.jobs.build
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = current_user.company_details.find_by(params[:company_detail_id])
    @company_details = @job.jobs.build(job_params)
    @company_details.user_id = current_user.id
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :description, :city, :work_type, :contract_type, :company_detail_id, :duties, :salary, :salary_type, :requirements, :slug)
    end

    # check if the user is authorised to edit,update or destroy the cv
    def correct_user
      @job = current_user.jobs.find_by(params[:friendly])
          redirect_to jobs_path, notice: "Not authorised to edit this job" if @job.nil?
    end
    # check if  cv belongs to the correct user - current user
      def current_user_jobs
        if user_signed_in?
          @jobs = current_user.jobs.order("created_at DESC")
        end
     end

     def autocomplete
       render json: Job.search(params[:term_job], autocomplete: false, limit: 10).map do |job|
         { title: job.title, value: job.id }
       end
     end

     def display_user_content
         @company_details = CompanyDetail.all
         @jobs_count = Job.where(company_detail_id: @company_details).count
     end

     # check if  the current user login in can view the page
     def check_current_profile
        if user_signed_in?
          if current_user.profile_type == "Individual"
            redirect_to root_path , notice:"Not authorised to view this page"
          end
        end
     end
end
