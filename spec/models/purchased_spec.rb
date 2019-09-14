require 'rails_helper'

RSpec.describe Purchased, type: :model do
  it "２つの外部キーを保存する" do
    purchased = Purchased.new(
            book_id:  1,
            user_id: 2,
    )
    expect(purchased.book_id).to eq 1
    expect(purchased.user_id).to eq 2
  end
end
