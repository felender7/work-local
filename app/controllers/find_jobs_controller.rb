class FindJobsController < ApplicationController
    before_action :set_job, only:[:show]
    before_action :check_current_profile
    def index
      @get_jobs = if params[:term_job].present?
          Job.search(params[:term_job])
        else
          Job.paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
        end
    end

    # GET /jobs/1
    # GET /jobs/1.json
    def show
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @get_jobs = Job.friendly.find_by(params[:id])
    end

    def autocomplete
      render json: Job.search(params[:term_job], autocomplete: false, limit: 10).map do |job|
        { title: job.title, value: job.id }
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
