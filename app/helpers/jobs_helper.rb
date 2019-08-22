module JobsHelper
  def user_added_to_Applied_Jobs? user, job
    user.jobs.where(user: user, job: job).any?
  end
end
