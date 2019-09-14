require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メールアドレス、パスワードの登録ができること" do
    user = User.new(
            name:  "田中太郎",
            email: "aaa@bbb.co.jp",
            password: "123qw",
    )
    expect(user.name).to eq "田中太郎"
    expect(user.email).to eq "aaa@bbb.co.jp"
    expect(user.password).to eq "123qw"
  end
end
