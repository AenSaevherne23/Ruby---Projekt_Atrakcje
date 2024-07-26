require "test_helper"

class UserAttractionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_attraction = user_attractions(:one)
  end

  test "should get index" do
    get user_attractions_url
    assert_response :success
  end

  test "should get new" do
    get new_user_attraction_url
    assert_response :success
  end

  test "should create user_attraction" do
    assert_difference("UserAttraction.count") do
      post user_attractions_url, params: { user_attraction: { attraction_id: @user_attraction.attraction_id, grades: @user_attraction.grades, user_id: @user_attraction.user_id } }
    end

    assert_redirected_to user_attraction_url(UserAttraction.last)
  end

  test "should show user_attraction" do
    get user_attraction_url(@user_attraction)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_attraction_url(@user_attraction)
    assert_response :success
  end

  test "should update user_attraction" do
    patch user_attraction_url(@user_attraction), params: { user_attraction: { attraction_id: @user_attraction.attraction_id, grades: @user_attraction.grades, user_id: @user_attraction.user_id } }
    assert_redirected_to user_attraction_url(@user_attraction)
  end

  test "should destroy user_attraction" do
    assert_difference("UserAttraction.count", -1) do
      delete user_attraction_url(@user_attraction)
    end

    assert_redirected_to user_attractions_url
  end
end
