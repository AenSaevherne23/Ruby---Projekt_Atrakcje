require "application_system_test_case"

class AttractionUsersTest < ApplicationSystemTestCase
  setup do
    @attraction_user = attraction_users(:one)
  end

  test "visiting the index" do
    visit attraction_users_url
    assert_selector "h1", text: "Attraction users"
  end

  test "should create attraction user" do
    visit attraction_users_url
    click_on "New attraction user"

    fill_in "Attraction", with: @attraction_user.attraction_id
    fill_in "User", with: @attraction_user.user_id
    click_on "Create Attraction user"

    assert_text "Attraction user was successfully created"
    click_on "Back"
  end

  test "should update Attraction user" do
    visit attraction_user_url(@attraction_user)
    click_on "Edit this attraction user", match: :first

    fill_in "Attraction", with: @attraction_user.attraction_id
    fill_in "User", with: @attraction_user.user_id
    click_on "Update Attraction user"

    assert_text "Attraction user was successfully updated"
    click_on "Back"
  end

  test "should destroy Attraction user" do
    visit attraction_user_url(@attraction_user)
    click_on "Destroy this attraction user", match: :first

    assert_text "Attraction user was successfully destroyed"
  end
end
