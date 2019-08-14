require 'test_helper'

class RegisterOnlineControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get register_online_index_url
    assert_response :success
  end

end
