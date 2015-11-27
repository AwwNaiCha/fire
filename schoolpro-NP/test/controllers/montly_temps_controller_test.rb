require 'test_helper'

class MontlyTempsControllerTest < ActionController::TestCase
  setup do
    @montly_temp = montly_temps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:montly_temps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create montly_temp" do
    assert_difference('MontlyTemp.count') do
      post :create, montly_temp: { apr: @montly_temp.apr, aug: @montly_temp.aug, dec: @montly_temp.dec, feb: @montly_temp.feb, jan: @montly_temp.jan, jul: @montly_temp.jul, jun: @montly_temp.jun, mar: @montly_temp.mar, may: @montly_temp.may, nov: @montly_temp.nov, oct: @montly_temp.oct, park_name: @montly_temp.park_name, sep: @montly_temp.sep }
    end

    assert_redirected_to montly_temp_path(assigns(:montly_temp))
  end

  test "should show montly_temp" do
    get :show, id: @montly_temp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @montly_temp
    assert_response :success
  end

  test "should update montly_temp" do
    patch :update, id: @montly_temp, montly_temp: { apr: @montly_temp.apr, aug: @montly_temp.aug, dec: @montly_temp.dec, feb: @montly_temp.feb, jan: @montly_temp.jan, jul: @montly_temp.jul, jun: @montly_temp.jun, mar: @montly_temp.mar, may: @montly_temp.may, nov: @montly_temp.nov, oct: @montly_temp.oct, park_name: @montly_temp.park_name, sep: @montly_temp.sep }
    assert_redirected_to montly_temp_path(assigns(:montly_temp))
  end

  test "should destroy montly_temp" do
    assert_difference('MontlyTemp.count', -1) do
      delete :destroy, id: @montly_temp
    end

    assert_redirected_to montly_temps_path
  end
end
