class FavoritesController < ApplicationController
  before_action :ensure_correct_user, {only: [:top, :index]}
  
  def top
    @favorite_books = current_user.favorite_books
  end
  
  def index
    @favorite_books = current_user.favorite_books
    
    @q = @favorite_books.ransack(params[:q])
    @favo_books = @q.result(distinct: true)
  end
  
  def destroy
    favorite = Favorite.find_by(user_id: current_user.id,book_id: params[:id])
    favorite.destroy
    
    redirect_to("/favorites/index")
  end
  
  def search
    @favorite_books = current_user.favorite_books || []
    @books = []
    
    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        hits: 20,
      })

      results.each do |result|
        book = read(result)
        @books << book
      end
    end
  end

  def create
    @book = Book.find_or_initialize_by(isbn: params[:isbn])

    unless @book.persisted?
      results = RakutenWebService::Books::Book.search(isbn: @book.isbn)
      @book = Book.new(read(results.first))
      @book.save
    end

    favorite = Favorite.new(user_id: current_user.id, book_id: @book.id)
    favorite.save
      redirect_to "/favorites/search"

  end

  private
  def read(result)
    title = result['title']
    url = result['itemUrl']
    isbn = result['isbn']
    itemPrice = result['itemPrice']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')

    {
      title: title,
      url: url,
      isbn: isbn,
      itemPrice: itemPrice,
      image_url: image_url,
    }

  end
end