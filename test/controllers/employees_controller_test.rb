require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { Affiliation_type: @employee.Affiliation_type, Dues: @employee.Dues, adress: @employee.adress, bank_account: @employee.bank_account, bank_name: @employee.bank_name, commision_rate: @employee.commision_rate, hourly_rate: @employee.hourly_rate, mail_address: @employee.mail_address, name: @employee.name, payment_method_type: @employee.payment_method_type, payment_type: @employee.payment_type, salary: @employee.salary }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    patch :update, id: @employee, employee: { Affiliation_type: @employee.Affiliation_type, Dues: @employee.Dues, adress: @employee.adress, bank_account: @employee.bank_account, bank_name: @employee.bank_name, commision_rate: @employee.commision_rate, hourly_rate: @employee.hourly_rate, mail_address: @employee.mail_address, name: @employee.name, payment_method_type: @employee.payment_method_type, payment_type: @employee.payment_type, salary: @employee.salary }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
