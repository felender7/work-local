require 'test_helper'

class VerificationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get verification_index_url
    assert_response :success
  end

end
