module Amazon::Kindle extend self
  def batch
    require 'httpclient'
    require 'json'
  
    uri = "https://api.dashblock.io/model/v1"
    params = {
      api_key: "32b90c90-c1cf-11e9-8910-ad408d8b1ff7",
      url: "https://www.amazon.co.jp/Kindle%E6%9C%88%E6%9B%BF%E3%82%8F%E3%82%8A/b/ref=amb_link_19?ie=UTF8&node=3338927051&pf_rd_m=AN1VRQENFRJN5&pf_rd_s=merchandised-search-1&pf_rd_r=JP6PKB3WAEWTEF92352J&pf_rd_r=JP6PKB3WAEWTEF92352J&pf_rd_t=101&pf_rd_p=d2a9c8c7-fbd5-476e-9049-b1b0cd537701&pf_rd_p=d2a9c8c7-fbd5-476e-9049-b1b0cd537701&pf_rd_i=2250738051",
      model_id: "mTyzQahsr"
    }
  
    client = HTTPClient.new
    request =  client.get(uri,params)
    response = JSON.parse(request.body)
    
    response["entities"].each do |res|
      
      book_title = res["title"]
      book_itemPrice = res["itemPrice"]
      
      @title = book_title
      
      if @title.present?
        results = RakutenWebService::Books::Book.search({
          title: @title,
          hits: 10,
        })
      end
  
      results.first.nil? ? next : (res_book = results.first)
      
      @book = Book.find_or_initialize_by(isbn: res_book.isbn)
      
      unless @book.persisted?
        results = RakutenWebService::Books::Book.search(isbn: @book.isbn)
        @book = Book.new(read(results.first))
        @book.save
      end
        
      store = Store.new(name: "kindle", itemPrice: book_itemPrice)
      store.save
      sale_book = SaleBook.new(store_id: store.id, book_id: @book.id)
      sale_book.save
    end
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