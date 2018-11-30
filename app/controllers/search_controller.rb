class SearchController < ApplicationController
    def results
        @products = Product.where('title LIKE ?', "%#{params[:q]}%")
    end
end
