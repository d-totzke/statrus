require 'test_helper'

class CurrentStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @current_status = current_statuses(:one)
  end

  test "should get index" do
    get current_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_current_status_url
    assert_response :success
  end

  test "should create current_status" do
    assert_difference('CurrentStatus.count') do
      post current_statuses_url, params: { current_status: { status_id: @current_status.status_id, user_id: @current_status.user_id } }
    end

    assert_redirected_to current_status_url(CurrentStatus.last)
  end

  test "should show current_status" do
    get current_status_url(@current_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_current_status_url(@current_status)
    assert_response :success
  end

  test "should update current_status" do
    patch current_status_url(@current_status), params: { current_status: { status_id: @current_status.status_id, user_id: @current_status.user_id } }
    assert_redirected_to current_status_url(@current_status)
  end

  test "should destroy current_status" do
    assert_difference('CurrentStatus.count', -1) do
      delete current_status_url(@current_status)
    end

    assert_redirected_to current_statuses_url
  end
end
