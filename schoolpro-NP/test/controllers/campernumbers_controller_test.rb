require 'test_helper'

class CampernumbersControllerTest < ActionController::TestCase
  setup do
    @campernumber = campernumbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campernumbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campernumber" do
    assert_difference('Campernumber.count') do
      post :create, campernumber: { apr: @campernumber.apr, aug: @campernumber.aug, dec: @campernumber.dec, feb: @campernumber.feb, jan: @campernumber.jan, jul: @campernumber.jul, jun: @campernumber.jun, mar: @campernumber.mar, may: @campernumber.may, nov: @campernumber.nov, oct: @campernumber.oct, park_name: @campernumber.park_name, sep: @campernumber.sep }
    end

    assert_redirected_to campernumber_path(assigns(:campernumber))
  end

  test "should show campernumber" do
    get :show, id: @campernumber
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campernumber
    assert_response :success
  end

  test "should update campernumber" do
    patch :update, id: @campernumber, campernumber: { apr: @campernumber.apr, aug: @campernumber.aug, dec: @campernumber.dec, feb: @campernumber.feb, jan: @campernumber.jan, jul: @campernumber.jul, jun: @campernumber.jun, mar: @campernumber.mar, may: @campernumber.may, nov: @campernumber.nov, oct: @campernumber.oct, park_name: @campernumber.park_name, sep: @campernumber.sep }
    assert_redirected_to campernumber_path(assigns(:campernumber))
  end

  test "should destroy campernumber" do
    assert_difference('Campernumber.count', -1) do
      delete :destroy, id: @campernumber
    end

    assert_redirected_to campernumbers_path
  end
end
