module V1
  module Categories
    class CategoriesController < ApplicationController
      skip_before_action :authenticate_request, only: [:index, :show]
      before_action :set_category, only: [:show, :update]

      # GET /categories
      def index
        @categories = Category.all
        json_response(Category.all)
      end

      # POST /categories
      def create
        @category = Category.create!(category_params)
        json_response(@category, :created)
      end

      # GET /categories/:id
      def show
        json_response(@category)
      end

      # PUT /categories/:id
      def update
        @category.update(category_params)
        head :no_content
      end

      private

      def category_params
        # whitelist params
        params.permit(:name)
      end

      def set_category
        @category = Category.find(params[:id])
      end
    end
  end
end
