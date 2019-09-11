class BookShelfsController < ApplicationController
  before_action :ensure_correct_user, {only: [:top, :search]}
  
  def top
    @purchased_books = current_user.purchased_books
    
    @q = @purchased_books.ransack(params[:q])
    @purchased_books = @q.result(distinct: true)
  end
  
  def destroy
    purchased = Purchased.find_by(user_id: current_user.id,book_id: params[:book_id])
    purchased.destroy
    
    redirect_to("/book_shelfs/top")
  end
  
  def state
    reed = Reed.new(user_id: current_user.id, book_id: params[:book_id])
    reed.save
    
    redirect_to("/book_shelfs/top")
  end
  
  def default
    reed = Reed.find_by(user_id: current_user.id, book_id: params[:book_id])
    reed.destroy
    
    redirect_to("/book_shelfs/top")
  end
  
  def search
    @purchased_books = current_user.purchased_books
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
    purchased = Purchased.new(user_id: current_user.id, book_id: @book.id)
    purchased.save
      redirect_to "/book_shelfs/search"

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
