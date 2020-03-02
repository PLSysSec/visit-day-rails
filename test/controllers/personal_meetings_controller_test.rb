require 'test_helper'

class PersonalMeetingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_meeting = personal_meetings(:one)
  end

  test "should get index" do
    get personal_meetings_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_meeting_url
    assert_response :success
  end

  test "should create personal_meeting" do
    assert_difference('PersonalMeeting.count') do
      post personal_meetings_url, params: { personal_meeting: {  } }
    end

    assert_redirected_to personal_meeting_url(PersonalMeeting.last)
  end

  test "should show personal_meeting" do
    get personal_meeting_url(@personal_meeting)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_meeting_url(@personal_meeting)
    assert_response :success
  end

  test "should update personal_meeting" do
    patch personal_meeting_url(@personal_meeting), params: { personal_meeting: {  } }
    assert_redirected_to personal_meeting_url(@personal_meeting)
  end

  test "should destroy personal_meeting" do
    assert_difference('PersonalMeeting.count', -1) do
      delete personal_meeting_url(@personal_meeting)
    end

    assert_redirected_to personal_meetings_url
  end
end
