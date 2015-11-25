require 'test_helper'

class AddColumnToParksControllerTest < ActionController::TestCase
  setup do
    @add_column_to_park = add_column_to_parks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_column_to_parks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_column_to_park" do
    assert_difference('AddColumnToPark.count') do
      post :create, add_column_to_park: { nation: @add_column_to_park.nation }
    end

    assert_redirected_to add_column_to_park_path(assigns(:add_column_to_park))
  end

  test "should show add_column_to_park" do
    get :show, id: @add_column_to_park
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_column_to_park
    assert_response :success
  end

  test "should update add_column_to_park" do
    patch :update, id: @add_column_to_park, add_column_to_park: { nation: @add_column_to_park.nation }
    assert_redirected_to add_column_to_park_path(assigns(:add_column_to_park))
  end

  test "should destroy add_column_to_park" do
    assert_difference('AddColumnToPark.count', -1) do
      delete :destroy, id: @add_column_to_park
    end

    assert_redirected_to add_column_to_parks_path
  end
end
