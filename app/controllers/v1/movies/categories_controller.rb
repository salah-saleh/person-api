module V1
  module Movies
    class CategoriesController < ApplicationController
      skip_before_action :authenticate_request, only: [:index]
      before_action :validate_user, only: [:create]
      before_action :validate_categories_exist, only: [:create]

      # GET /categories
      def index
        json_response(movie.categories)
      end

      # POST /categories
      def create
        movie.categories = category_params
        movie.save!
        head :no_content
      end

      private

      def movie
        Movie.find(params[:movie_id])
      end

      def validate_user
        @current_user.id == movie.user.id
      end

      def validate_categories_exist
        category_params[:categories].each do |category|
          Category.find_by!(name: category)
        end
      end

      def category_params
        # whitelist params
        params.permit(:categories)
      end

    end
  end
end
