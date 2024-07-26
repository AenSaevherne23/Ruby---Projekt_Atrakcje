require "test_helper"

class AttractionUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attraction_user = attraction_users(:one)
  end

  test "should get index" do
    get attraction_users_url
    assert_response :success
  end

  test "should get new" do
    get new_attraction_user_url
    assert_response :success
  end

  test "should create attraction_user" do
    assert_difference("AttractionUser.count") do
      post attraction_users_url, params: { attraction_user: { attraction_id: @attraction_user.attraction_id, user_id: @attraction_user.user_id } }
    end

    assert_redirected_to attraction_user_url(AttractionUser.last)
  end

  test "should show attraction_user" do
    get attraction_user_url(@attraction_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_attraction_user_url(@attraction_user)
    assert_response :success
  end

  test "should update attraction_user" do
    patch attraction_user_url(@attraction_user), params: { attraction_user: { attraction_id: @attraction_user.attraction_id, user_id: @attraction_user.user_id } }
    assert_redirected_to attraction_user_url(@attraction_user)
  end

  test "should destroy attraction_user" do
    assert_difference("AttractionUser.count", -1) do
      delete attraction_user_url(@attraction_user)
    end

    assert_redirected_to attraction_users_url
  end
end
