require 'test_helper'

class ServersControllerTest < ActionController::TestCase
  setup do
    @server = servers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:servers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create server" do
    assert_difference('Server.count') do
      post :create, server: { customer_email: @server.customer_email, customer_name: @server.customer_name, server_account: @server.server_account, server_id: @server.server_id, server_name: @server.server_name, server_password: @server.server_password, server_private_ipaddress: @server.server_private_ipaddress, server_public_ipaddress: @server.server_public_ipaddress, server_status: @server.server_status, server_type: @server.server_type }
    end

    assert_redirected_to server_path(assigns(:server))
  end

  test "should show server" do
    get :show, id: @server
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @server
    assert_response :success
  end

  test "should update server" do
    patch :update, id: @server, server: { customer_email: @server.customer_email, customer_name: @server.customer_name, server_account: @server.server_account, server_id: @server.server_id, server_name: @server.server_name, server_password: @server.server_password, server_private_ipaddress: @server.server_private_ipaddress, server_public_ipaddress: @server.server_public_ipaddress, server_status: @server.server_status, server_type: @server.server_type }
    assert_redirected_to server_path(assigns(:server))
  end

  test "should destroy server" do
    assert_difference('Server.count', -1) do
      delete :destroy, id: @server
    end

    assert_redirected_to servers_path
  end
end
