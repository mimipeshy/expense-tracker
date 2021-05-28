class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :update, :destroy]

  # GET /reviews
  def index
    @reviews = Review.all
    json_response(@reviews)
  end

  # POST /reviews
  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  # GET /reviews/:id
  def show
    json_response(@review)
  end

  # PUT /reviews/:id
  def update
    @review.update(review_params)
    head :no_content
  end

  # DELETE /reviews/:id
  def destroy
    @review.destroy
    head :no_content
  end

  private

  def review_params
    # whitelist params
    params.permit(:title, :description, :score, :book_id)
  end

  def set_review
    @review = Review.find(params[:book_id])
  end
end
