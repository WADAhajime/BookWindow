require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get favorites_top_url
    assert_response :success
  end

end
