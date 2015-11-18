require 'test_helper'

class VisitornumbersControllerTest < ActionController::TestCase
  setup do
    @visitornumber = visitornumbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visitornumbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visitornumber" do
    assert_difference('Visitornumber.count') do
      post :create, visitornumber: { apr: @visitornumber.apr, aug: @visitornumber.aug, dec: @visitornumber.dec, feb: @visitornumber.feb, jan: @visitornumber.jan, jul: @visitornumber.jul, jun: @visitornumber.jun, mar: @visitornumber.mar, may: @visitornumber.may, nov: @visitornumber.nov, oct: @visitornumber.oct, park_name: @visitornumber.park_name, sep: @visitornumber.sep }
    end

    assert_redirected_to visitornumber_path(assigns(:visitornumber))
  end

  test "should show visitornumber" do
    get :show, id: @visitornumber
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visitornumber
    assert_response :success
  end

  test "should update visitornumber" do
    patch :update, id: @visitornumber, visitornumber: { apr: @visitornumber.apr, aug: @visitornumber.aug, dec: @visitornumber.dec, feb: @visitornumber.feb, jan: @visitornumber.jan, jul: @visitornumber.jul, jun: @visitornumber.jun, mar: @visitornumber.mar, may: @visitornumber.may, nov: @visitornumber.nov, oct: @visitornumber.oct, park_name: @visitornumber.park_name, sep: @visitornumber.sep }
    assert_redirected_to visitornumber_path(assigns(:visitornumber))
  end

  test "should destroy visitornumber" do
    assert_difference('Visitornumber.count', -1) do
      delete :destroy, id: @visitornumber
    end

    assert_redirected_to visitornumbers_path
  end
end
