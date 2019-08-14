require "application_system_test_case"

class CompanyDetailsTest < ApplicationSystemTestCase
  setup do
    @company_detail = company_details(:one)
  end

  test "visiting the index" do
    visit company_details_url
    assert_selector "h1", text: "Company Details"
  end

  test "creating a Company detail" do
    visit company_details_url
    click_on "New Company Detail"

    fill_in "Company Name", with: @company_detail.company_name
    fill_in "Industry", with: @company_detail.industry
    fill_in "Registration", with: @company_detail.registration
    fill_in "Tel", with: @company_detail.tel
    click_on "Create Company detail"

    assert_text "Company detail was successfully created"
    click_on "Back"
  end

  test "updating a Company detail" do
    visit company_details_url
    click_on "Edit", match: :first

    fill_in "Company Name", with: @company_detail.company_name
    fill_in "Industry", with: @company_detail.industry
    fill_in "Registration", with: @company_detail.registration
    fill_in "Tel", with: @company_detail.tel
    click_on "Update Company detail"

    assert_text "Company detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Company detail" do
    visit company_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Company detail was successfully destroyed"
  end
end
