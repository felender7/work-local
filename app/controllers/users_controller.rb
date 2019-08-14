class UsersController < ApplicationController
  before_action :display_user_content, only:[:show]
  before_action :authenticate_user!, only:[:show]
  

  def index
    @users = User.where(profile_type: "Individual").order("updated_at DESC")

  end

  def edit
  end

  def show
    @user = User.friendly.find(params[:id])
    @reviews = Review.where(user_id: @user.id).paginate(:page => params[:page], :per_page => 4).order('created_at DESC')

    if @reviews.blank?
      @avg_review = 0
    else
        @avg_review = @reviews.average(:rating).present? ? @reviews.average(:rating).round(2) : 0
      end
  end
  end

  def display_user_content
      @user = User.friendly.find(params[:id])
      @display_cv = @user.cvs
      @display_referrals = @user.referrals.order("created_at DESC")
      @display_documents = @user.documents.order("created_at DESC")
  end

  # check if  the current user login in can view the page
  def check_current_profile
     if user_signed_in?
       if current_user.profile_type == "Individual"
         redirect_to root_path , notice:"Not authorised to view this page"
       end
     end
  end
