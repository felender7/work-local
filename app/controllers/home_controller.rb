class HomeController < ApplicationController
before_action :mark_as_read, if: :user_signed_in?


  def index
     @company_details = CompanyDetail.all
     @announcements = Announcement.order(published_at: :desc)
  end

  def company
    @company_details = CompanyDetail.all
  end

  def terms
  end

  def privacy
  end

  private

    def mark_as_read
      current_user.update(announcements_last_read_at: Time.zone.now)
    end

end
