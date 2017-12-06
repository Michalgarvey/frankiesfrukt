require 'test_helper'

class SimplePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get other" do
    get simple_pages_other_url
    assert_response :success
  end

end
