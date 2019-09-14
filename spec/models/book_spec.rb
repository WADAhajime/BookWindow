require 'rails_helper'

RSpec.describe Book, type: :model do
  it "書籍タイトル、isbn、image_url、itemPriceを保存する" do
    book = Book.new(
            title:  "田中太郎",
            isbn: "12345",
            image_url: "123qw",
            itemPrice: 100,
    )
    expect(book.title).to eq "田中太郎"
    expect(book.isbn).to eq "12345"
    expect(book.image_url).to eq "123qw"
    expect(book.itemPrice).to eq 100
  end
end