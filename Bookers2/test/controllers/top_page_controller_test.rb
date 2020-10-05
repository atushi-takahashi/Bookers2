require 'test_helper'

class TopPageControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get top_page_top_url
    assert_response :success
  end

  test "should get about" do
    get top_page_about_url
    assert_response :success
  end

end
