require 'test_helper'

class FireLevelsControllerTest < ActionController::TestCase
  setup do
    @fire_level = fire_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fire_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fire_level" do
    assert_difference('FireLevel.count') do
      post :create, fire_level: { date: @fire_level.date, level: @fire_level.level, park_name: @fire_level.park_name }
    end

    assert_redirected_to fire_level_path(assigns(:fire_level))
  end

  test "should show fire_level" do
    get :show, id: @fire_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fire_level
    assert_response :success
  end

  test "should update fire_level" do
    patch :update, id: @fire_level, fire_level: { date: @fire_level.date, level: @fire_level.level, park_name: @fire_level.park_name }
    assert_redirected_to fire_level_path(assigns(:fire_level))
  end

  test "should destroy fire_level" do
    assert_difference('FireLevel.count', -1) do
      delete :destroy, id: @fire_level
    end

    assert_redirected_to fire_levels_path
  end
end
