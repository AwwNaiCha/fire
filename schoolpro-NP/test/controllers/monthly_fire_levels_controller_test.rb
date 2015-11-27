require 'test_helper'

class MonthlyFireLevelsControllerTest < ActionController::TestCase
  setup do
    @monthly_fire_level = monthly_fire_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthly_fire_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monthly_fire_level" do
    assert_difference('MonthlyFireLevel.count') do
      post :create, monthly_fire_level: { apr: @monthly_fire_level.apr, aug: @monthly_fire_level.aug, dec: @monthly_fire_level.dec, feb: @monthly_fire_level.feb, jan: @monthly_fire_level.jan, jul: @monthly_fire_level.jul, jun: @monthly_fire_level.jun, mar: @monthly_fire_level.mar, may: @monthly_fire_level.may, nov: @monthly_fire_level.nov, oct: @monthly_fire_level.oct, park_name: @monthly_fire_level.park_name, sep: @monthly_fire_level.sep }
    end

    assert_redirected_to monthly_fire_level_path(assigns(:monthly_fire_level))
  end

  test "should show monthly_fire_level" do
    get :show, id: @monthly_fire_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monthly_fire_level
    assert_response :success
  end

  test "should update monthly_fire_level" do
    patch :update, id: @monthly_fire_level, monthly_fire_level: { apr: @monthly_fire_level.apr, aug: @monthly_fire_level.aug, dec: @monthly_fire_level.dec, feb: @monthly_fire_level.feb, jan: @monthly_fire_level.jan, jul: @monthly_fire_level.jul, jun: @monthly_fire_level.jun, mar: @monthly_fire_level.mar, may: @monthly_fire_level.may, nov: @monthly_fire_level.nov, oct: @monthly_fire_level.oct, park_name: @monthly_fire_level.park_name, sep: @monthly_fire_level.sep }
    assert_redirected_to monthly_fire_level_path(assigns(:monthly_fire_level))
  end

  test "should destroy monthly_fire_level" do
    assert_difference('MonthlyFireLevel.count', -1) do
      delete :destroy, id: @monthly_fire_level
    end

    assert_redirected_to monthly_fire_levels_path
  end
end
