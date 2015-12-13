class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_user, except: :destroy
  before_action :require_user, only: [:create, :edit, :update, :destroy]

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = @user.id

    if @review.save
      flash[:success] = 'Review was successfully created.'
      redirect_to user_path(@user)
    else
      flash[:danger] = "Try again"
      render :new
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
      if @review.update(review_params)
        flash[:success] = 'Review was successfully updated.'
        redirect_to user_path(@user)
      else
        flash[:danger] = "Try again"
        render :new
      end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    temp_id = @review.user_id
    Review.find(params[:id]).destroy
    flash[:success] = "Review Deleted"
    redirect_to user_path(temp_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end