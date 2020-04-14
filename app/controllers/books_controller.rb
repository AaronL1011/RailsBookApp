class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data
    
    def index
        render json: @data
    end
    
    #Show a single book
    def show
        book_info = {}
        for book in @data
            if book[:id] == params[:id]
                book_info = book
            end
        end
        render json: book_info
    end
    
    #Create a new book
    def create
        title = params[:title]
        author = params[:author]
        id = (@data[-1][:id].to_i + 1).to_s
        new_book = {id: id, title: title, author: author}
        @data.push(new_book)
        render json: @data
    end
    
    #Update a book
    def update
        new_title = params[:new_title]
        new_author = params[:new_author]

        for book in @data
            if book[:id] == params[:id]
                if new_title
                    book[:title] = new_title
                end
                if new_author
                    book[:author] = new_author
                end
            end
        end
        render json: @data
    end
    
    #Remove a book
    def destroy
        for book in @data
            if book[:id] == params[:id]
                @data.delete(book)
            end
        end
        render json: @data
    end
    
    private
    def setup_data
        @data = [
            { id: "1", title: "Harry Potter", author: "J.K Rowling" },
            { id: "2", title: "Name of the wind", author: "Patrick Rothfuss" }
        ]
    end
end