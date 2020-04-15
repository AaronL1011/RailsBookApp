class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data
    
    #Show a single book
    def show
        for book in session[:book_data]
            if book["id"] == params[:id]
                render json: book
            end
        end
    end

    def index
        render json: session[:book_data]
    end
    
    #Create a new book
    def create
        title = params[:title]
        author = params[:author]
        id = session[:book_data][-1]["id"] + 1
        new_book = {id: id, title: title, author: author}
        session[:book_data].push(new_book)
        render json: session[:book_data]
    end
    
    #Update a book
    def update
        title = params[:title]
        author = params[:author]

        for book in session[:book_data]
            if book["id"] == params[:id]
                if title
                    book[:title] = title
                end
                if author
                    book[:author] = author
                end
            end
        end
        render json: book
    end
    
    #Remove a book
    def destroy
        session[:book_data] = session[:book_data].select {|book| book["id"] != params[:id]} 
        render json: session[:book_data]
    end
    
    private
    def setup_data
        session[:book_data] = [
            { id: 1, title: "Harry Potter", author: "J.K Rowling" },
            { id: 2, title: "Name of the wind", author: "Patrick Rothfuss" }
        ] unless session[:book_data]

    end
end