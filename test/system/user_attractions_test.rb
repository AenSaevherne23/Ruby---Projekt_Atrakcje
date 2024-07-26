require "application_system_test_case"

class UserAttractionsTest < ApplicationSystemTestCase
  setup do
    @user_attraction = user_attractions(:one)
  end

  test "visiting the index" do
    visit user_attractions_url
    assert_selector "h1", text: "User attractions"
  end

  test "should create user attraction" do
    visit user_attractions_url
    click_on "New user attraction"

    fill_in "Attraction", with: @user_attraction.attraction_id
    fill_in "Grades", with: @user_attraction.grades
    fill_in "User", with: @user_attraction.user_id
    click_on "Create User attraction"

    assert_text "User attraction was successfully created"
    click_on "Back"
  end

  test "should update User attraction" do
    visit user_attraction_url(@user_attraction)
    click_on "Edit this user attraction", match: :first

    fill_in "Attraction", with: @user_attraction.attraction_id
    fill_in "Grades", with: @user_attraction.grades
    fill_in "User", with: @user_attraction.user_id
    click_on "Update User attraction"

    assert_text "User attraction was successfully updated"
    click_on "Back"
  end

  test "should destroy User attraction" do
    visit user_attraction_url(@user_attraction)
    click_on "Destroy this user attraction", match: :first

    assert_text "User attraction was successfully destroyed"
  end
end
