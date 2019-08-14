require 'test_helper'

class JobPlacementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_placement_index_url
    assert_response :success
  end

end
