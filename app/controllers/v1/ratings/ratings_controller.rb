module V1
  module Ratings
    class RatingsController < ApplicationController

      # PUT /ratings/:id
      def update
        @rating.update(rating_params)
        head :no_content
      end

      private

      def rating_params
        # whitelist params
        params.permit(:score)
      end

      def set_rating
        @rating = Rating.find(params[:id])
      end
    end
  end
end
