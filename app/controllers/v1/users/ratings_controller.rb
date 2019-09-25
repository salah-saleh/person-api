module V1
  module Users
    class RatingsController < ApplicationController

      # GET /ratings
      def index
        @ratings = @current_user.ratings
        json_response(@ratings)
      end

      private

    end
  end
end
