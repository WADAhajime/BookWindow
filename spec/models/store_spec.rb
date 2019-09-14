require 'rails_helper'

RSpec.describe Store, type: :model do
  it "２つの外部キーを保存する" do
    favorite = Favorite.new(
            book_id:  1,
            user_id: 2,
    )
    expect(favorite.book_id).to eq 1
    expect(favorite.user_id).to eq 2
  end
end
