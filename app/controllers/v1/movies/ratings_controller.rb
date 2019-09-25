module V1
  module Movies
    class RatingsController < ApplicationController
      skip_before_action :authenticate_request, only: [:index]
      before_action :validate_user, only: [:create]

      # GET /ratings
      def index
        @ratings = Rating.all
        json_response(@ratings)
      end

      # POST /ratings
      def create
        rating = Rating.create!(rating_params)
        rating.movie = movie
        rating.save!
        head :no_content
      end

      private

      def movie
        Movie.find(params[:movie_id])
      end

      def validate_user
        @current_user.id == movie.user.id
      end

      def rating_params
        # whitelist params
        params.permit(:score)
      end

    end
  end
end
