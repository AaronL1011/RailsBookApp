class PagesController < ApplicationController
    def index
        @names = ["Mike", "Jim", "Pam"]
        @is_subscriber = false
        @age = params[:age].to_i
    end
end