require 'test_helper'

class ProductsInfosControllerTest < ActionController::TestCase
  setup do
    @products_info = products_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create products_info" do
    assert_difference('ProductsInfo.count') do
      post :create, :products_info => @products_info.attributes
    end

    assert_redirected_to products_info_path(assigns(:products_info))
  end

  test "should show products_info" do
    get :show, :id => @products_info.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @products_info.to_param
    assert_response :success
  end

  test "should update products_info" do
    put :update, :id => @products_info.to_param, :products_info => @products_info.attributes
    assert_redirected_to products_info_path(assigns(:products_info))
  end

  test "should destroy products_info" do
    assert_difference('ProductsInfo.count', -1) do
      delete :destroy, :id => @products_info.to_param
    end

    assert_redirected_to products_infos_path
  end
end
