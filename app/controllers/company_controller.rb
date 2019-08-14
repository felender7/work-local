class CompanyController < ApplicationController
before_action :authenticate_user!
before_action :check_current_profile

  def index

  end


private

  def check_current_profile
     if user_signed_in?
       if current_user.profile_type == "Individual"
         redirect_to root_path , notice:"Not authorised to view this page"
       end
     end
  end
end
