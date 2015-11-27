require 'test_helper'

class MonthlyPrcpsControllerTest < ActionController::TestCase
  setup do
    @monthly_prcp = monthly_prcps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthly_prcps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monthly_prcp" do
    assert_difference('MonthlyPrcp.count') do
      post :create, monthly_prcp: { apr: @monthly_prcp.apr, aug: @monthly_prcp.aug, dec: @monthly_prcp.dec, feb: @monthly_prcp.feb, jan: @monthly_prcp.jan, jul: @monthly_prcp.jul, jun: @monthly_prcp.jun, mar: @monthly_prcp.mar, may: @monthly_prcp.may, nov: @monthly_prcp.nov, oct: @monthly_prcp.oct, park_name: @monthly_prcp.park_name, sep: @monthly_prcp.sep }
    end

    assert_redirected_to monthly_prcp_path(assigns(:monthly_prcp))
  end

  test "should show monthly_prcp" do
    get :show, id: @monthly_prcp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monthly_prcp
    assert_response :success
  end

  test "should update monthly_prcp" do
    patch :update, id: @monthly_prcp, monthly_prcp: { apr: @monthly_prcp.apr, aug: @monthly_prcp.aug, dec: @monthly_prcp.dec, feb: @monthly_prcp.feb, jan: @monthly_prcp.jan, jul: @monthly_prcp.jul, jun: @monthly_prcp.jun, mar: @monthly_prcp.mar, may: @monthly_prcp.may, nov: @monthly_prcp.nov, oct: @monthly_prcp.oct, park_name: @monthly_prcp.park_name, sep: @monthly_prcp.sep }
    assert_redirected_to monthly_prcp_path(assigns(:monthly_prcp))
  end

  test "should destroy monthly_prcp" do
    assert_difference('MonthlyPrcp.count', -1) do
      delete :destroy, id: @monthly_prcp
    end

    assert_redirected_to monthly_prcps_path
  end
end
