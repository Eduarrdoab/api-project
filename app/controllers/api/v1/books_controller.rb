class Api::V1::BooksController < Api::V1::ApiController
    before_action :set_user, only: [:show]

    def index
        @book = Book.all

        render json: @book
    end

    def show
        render json: @book
    end

    def create
            @book = Book.new(book_params)

            if @book.save
                render json: @book, status: :created
            else
                render json: @book.errors, status: :unprocessable_entity
            end
    end

    def rent

    end

    
    private

    def book_params
        params.require(:book).permit(:title, :description)
    end

    #Usar caso queira mostrar os livros criados por cada usuario
    def set_user
        @book = Book.find(params:[:id])
    end

end
