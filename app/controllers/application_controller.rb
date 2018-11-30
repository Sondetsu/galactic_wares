# frozen_string_literal: true

class ApplicationController < ActionController::Base
    before_action :set_session
    before_action :load_cart

    def set_session
        session[:cart] ||= []
    end

    def load_cart
        @cart = Product.find(session[:cart])
    end
end
