require 'rails_helper'

RSpec.describe Store, type: :model do
  it "書店名と価格の保存" do
    store = Store.new(
            name:  "アイウエオ書店",
            itemPrice: "500",
    )
    expect(store.name).to eq "アイウエオ書店"
    expect(store.itemPrice).to eq "500"
  end
end
