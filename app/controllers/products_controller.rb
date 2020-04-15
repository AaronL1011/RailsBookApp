class ProductsController < ApplicationController
    def index 
        @products = ["Toothbrush", "Sweater", "Waterbottle"]
    end
end