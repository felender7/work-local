require 'test_helper'

class FindJobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get find_jobs_index_url
    assert_response :success
  end

end
