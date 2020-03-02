require 'test_helper'

class ScheduleItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule_item = schedule_items(:one)
  end

  test "should get index" do
    get schedule_items_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_item_url
    assert_response :success
  end

  test "should create schedule_item" do
    assert_difference('ScheduleItem.count') do
      post schedule_items_url, params: { schedule_item: {  } }
    end

    assert_redirected_to schedule_item_url(ScheduleItem.last)
  end

  test "should show schedule_item" do
    get schedule_item_url(@schedule_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_item_url(@schedule_item)
    assert_response :success
  end

  test "should update schedule_item" do
    patch schedule_item_url(@schedule_item), params: { schedule_item: {  } }
    assert_redirected_to schedule_item_url(@schedule_item)
  end

  test "should destroy schedule_item" do
    assert_difference('ScheduleItem.count', -1) do
      delete schedule_item_url(@schedule_item)
    end

    assert_redirected_to schedule_items_url
  end
end
