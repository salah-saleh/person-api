module V1
  module Movies
    class MoviesController < ApplicationController
      skip_before_action :authenticate_request, only: [:index, :show]
      before_action :set_movie, only: [:show, :update, :destroy]
      before_action :validate_user, only: [:updae, :destroy]

      # GET /movies
      def index
        # TODO: filters
        @movies = Movie.all
        json_response(@movies)
      end

      # GET /movies/:id
      def show
        json_response(@movie)
      end

      # PUT /movies/:id
      def update
        @movie.update(movie_params)
        head :no_content
      end

      # DELETE /movies/:id
      def destroy
        @movie.destroy
        head :no_content
      end

      private

      def validate_user
        @current_user.id == @movie.user.id
      end

      def movie_params
        # whitelist params
        params.permit(:title, :text)
      end

      def set_movie
        @movie = Movie.find(params[:id])
      end
    end
  end
end
