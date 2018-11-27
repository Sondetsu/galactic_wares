# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order("title").page(params[:page]).per(5)
  end

  def show
    @product = Product.find(params[:id])
  end
end
