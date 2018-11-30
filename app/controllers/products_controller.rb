# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.order('title').page(params[:page]).per(5)
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_item
    id = params[:id].to_i

    session[:cart] << id unless session[:cart].include?(id)

    flash[:success] = 'You have added an item to your cart.'

    redirect_to root_url
  end
end
