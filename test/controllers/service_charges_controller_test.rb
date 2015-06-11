require 'test_helper'

class ServiceChargesControllerTest < ActionController::TestCase
  setup do
    @service_charge = service_charges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_charges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_charge" do
    assert_difference('ServiceCharge.count') do
      post :create, service_charge: { charge: @service_charge.charge, date: @service_charge.date, emp_id: @service_charge.emp_id }
    end

    assert_redirected_to service_charge_path(assigns(:service_charge))
  end

  test "should show service_charge" do
    get :show, id: @service_charge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_charge
    assert_response :success
  end

  test "should update service_charge" do
    patch :update, id: @service_charge, service_charge: { charge: @service_charge.charge, date: @service_charge.date, emp_id: @service_charge.emp_id }
    assert_redirected_to service_charge_path(assigns(:service_charge))
  end

  test "should destroy service_charge" do
    assert_difference('ServiceCharge.count', -1) do
      delete :destroy, id: @service_charge
    end

    assert_redirected_to service_charges_path
  end
end
