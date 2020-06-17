require "application_system_test_case"

class CurrentStatusesTest < ApplicationSystemTestCase
  setup do
    @current_status = current_statuses(:one)
  end

  test "visiting the index" do
    visit current_statuses_url
    assert_selector "h1", text: "Current Statuses"
  end

  test "creating a Current status" do
    visit current_statuses_url
    click_on "New Current Status"

    fill_in "Status", with: @current_status.status_id
    fill_in "User", with: @current_status.user_id
    click_on "Create Current status"

    assert_text "Current status was successfully created"
    click_on "Back"
  end

  test "updating a Current status" do
    visit current_statuses_url
    click_on "Edit", match: :first

    fill_in "Status", with: @current_status.status_id
    fill_in "User", with: @current_status.user_id
    click_on "Update Current status"

    assert_text "Current status was successfully updated"
    click_on "Back"
  end

  test "destroying a Current status" do
    visit current_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Current status was successfully destroyed"
  end
end
