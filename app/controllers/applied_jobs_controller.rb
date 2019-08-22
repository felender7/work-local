class AppliedJobsController < ApplicationController
  before_action :authenticate_user!


  def index
    @applied_jobs = current_user.applied_job_additions
  end
end
