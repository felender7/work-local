require 'test_helper'

class UploadDocumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get upload_documents_index_url
    assert_response :success
  end

end
