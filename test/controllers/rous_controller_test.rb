require 'test_helper'

class RousControllerTest < ActionController::TestCase
  setup do
    @rou = rous(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rous)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rou" do
    assert_difference('Rou.count') do
      post :create, rou: { IMEI_no: @rou.IMEI_no, Mobile_no: @rou.Mobile_no }
    end

    assert_redirected_to rou_path(assigns(:rou))
  end

  test "should show rou" do
    get :show, id: @rou
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rou
    assert_response :success
  end

  test "should update rou" do
    patch :update, id: @rou, rou: { IMEI_no: @rou.IMEI_no, Mobile_no: @rou.Mobile_no }
    assert_redirected_to rou_path(assigns(:rou))
  end

  test "should destroy rou" do
    assert_difference('Rou.count', -1) do
      delete :destroy, id: @rou
    end

    assert_redirected_to rous_path
  end
end
