require 'test_helper'

class AppliedJobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get applied_jobs_index_url
    assert_response :success
  end

end
