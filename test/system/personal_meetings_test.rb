require "application_system_test_case"

class PersonalMeetingsTest < ApplicationSystemTestCase
  setup do
    @personal_meeting = personal_meetings(:one)
  end

  test "visiting the index" do
    visit personal_meetings_url
    assert_selector "h1", text: "Personal Meetings"
  end

  test "creating a Personal meeting" do
    visit personal_meetings_url
    click_on "New Personal Meeting"

    click_on "Create Personal meeting"

    assert_text "Personal meeting was successfully created"
    click_on "Back"
  end

  test "updating a Personal meeting" do
    visit personal_meetings_url
    click_on "Edit", match: :first

    click_on "Update Personal meeting"

    assert_text "Personal meeting was successfully updated"
    click_on "Back"
  end

  test "destroying a Personal meeting" do
    visit personal_meetings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personal meeting was successfully destroyed"
  end
end
