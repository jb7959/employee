require 'test_helper'

class PayDaysControllerTest < ActionController::TestCase
  setup do
    @pay_day = pay_days(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pay_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pay_day" do
    assert_difference('PayDay.count') do
      post :create, pay_day: { emp_id: @pay_day.emp_id, lastPayday: @pay_day.lastPayday, name: @pay_day.name, pay: @pay_day.pay, payment_type: @pay_day.payment_type }
    end

    assert_redirected_to pay_day_path(assigns(:pay_day))
  end

  test "should show pay_day" do
    get :show, id: @pay_day
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pay_day
    assert_response :success
  end

  test "should update pay_day" do
    patch :update, id: @pay_day, pay_day: { emp_id: @pay_day.emp_id, lastPayday: @pay_day.lastPayday, name: @pay_day.name, pay: @pay_day.pay, payment_type: @pay_day.payment_type }
    assert_redirected_to pay_day_path(assigns(:pay_day))
  end

  test "should destroy pay_day" do
    assert_difference('PayDay.count', -1) do
      delete :destroy, id: @pay_day
    end

    assert_redirected_to pay_days_path
  end
end
