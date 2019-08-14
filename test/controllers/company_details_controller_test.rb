require 'test_helper'

class CompanyDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_detail = company_details(:one)
  end

  test "should get index" do
    get company_details_url
    assert_response :success
  end

  test "should get new" do
    get new_company_detail_url
    assert_response :success
  end

  test "should create company_detail" do
    assert_difference('CompanyDetail.count') do
      post company_details_url, params: { company_detail: { company_name: @company_detail.company_name, industry: @company_detail.industry, registration: @company_detail.registration, tel: @company_detail.tel } }
    end

    assert_redirected_to company_detail_url(CompanyDetail.last)
  end

  test "should show company_detail" do
    get company_detail_url(@company_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_detail_url(@company_detail)
    assert_response :success
  end

  test "should update company_detail" do
    patch company_detail_url(@company_detail), params: { company_detail: { company_name: @company_detail.company_name, industry: @company_detail.industry, registration: @company_detail.registration, tel: @company_detail.tel } }
    assert_redirected_to company_detail_url(@company_detail)
  end

  test "should destroy company_detail" do
    assert_difference('CompanyDetail.count', -1) do
      delete company_detail_url(@company_detail)
    end

    assert_redirected_to company_details_url
  end
end
