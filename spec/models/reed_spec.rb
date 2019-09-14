require 'rails_helper'

RSpec.describe Reed, type: :model do
  it "２つの外部キーを保存する" do
    reed = Reed.new(
            book_id:  1,
            user_id: 2,
    )
    expect(reed.book_id).to eq 1
    expect(reed.user_id).to eq 2
  end
end
