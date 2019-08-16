class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :correct_user_for_reviews, only: [:edit, :update, :destroy]
  before_action :current_user_reviews, only:[:show]

 def index
   @reviews = Review.all.order('created_at DESC')
 end

  def new
    @review = current_user.reviews.build
  end


  def create
    @review = current_user.reviews.build(review_params)
    @review.user_id = current_user.id
    @review.user_id = @user.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to users_path, notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to users_path, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_user
      @user = User.friendly.find(params[:user_id])
    end


    # check if the user is authorised to edit,update or destroy the cv
    def correct_user_for_reviews
      @review = current_user.reviews.find_by(params[:friendly])
          redirect_to reviewss_path, notice: "Not authorised to edit this review" if @review.nil?
    end
    # check if  cv belongs to the correct user - current user
      def current_user_reviews
        if user_signed_in?
          @reviews = current_user.reviews.order("created_at DESC")
       end
     end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment, :user_id, :cv_id)
    end

end
