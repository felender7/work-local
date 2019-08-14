class SummaryController < ApplicationController
# fetching the cv, referrals and document for summary
    def show
       @cv = current_user.cvs.find_by(params[:id])
       @referrals = Referral.all
       @documents = Document.all
       check_current_profile
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
