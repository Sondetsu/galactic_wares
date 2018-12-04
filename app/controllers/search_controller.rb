# frozen_string_literal: true

class SearchController < ApplicationController
  def results
    if params[:search][:category].present?
      @category = Category.find(params[:search][:category])
      @products = @category.products.where('title LIKE ?', "%#{params[:q]}%")
                           .order('title').page(params[:page]).per(5)

      # This is to get the proper results size, despite pagination.
      @count = @category.products.where('title LIKE ?', "%#{params[:q]}%").size
    else
      @products = Product.where('title LIKE ?', "%#{params[:q]}%")
                         .order('title').page(params[:page]).per(5)
      @count = Product.where('title LIKE ?', "%#{params[:q]}%")
                      .order('title').size
    end
  end
end
