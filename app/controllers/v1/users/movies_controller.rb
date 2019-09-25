module V1
  module Users
    class MoviesController < ApplicationController

      # GET /movies
      def index
        @movies = @current_user.movies
        json_response(@movies)
      end

      # POST /movies
      def create
        movie = Movie.create!(movie_params)
        json_response(movie)
      end

      private

      def movie_params
        # whitelist params
        params.permit(:title, :text)
      end

    end
  end
end
