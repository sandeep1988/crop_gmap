require 'test_helper'

class AccountHistoriesControllerTest < ActionController::TestCase
  setup do
    @account_history = account_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_history" do
    assert_difference('AccountHistory.count') do
      post :create, account_history: { credit_rating: @account_history.credit_rating }
    end

    assert_redirected_to account_history_path(assigns(:account_history))
  end

  test "should show account_history" do
    get :show, id: @account_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_history
    assert_response :success
  end

  test "should update account_history" do
    put :update, id: @account_history, account_history: { credit_rating: @account_history.credit_rating }
    assert_redirected_to account_history_path(assigns(:account_history))
  end

  test "should destroy account_history" do
    assert_difference('AccountHistory.count', -1) do
      delete :destroy, id: @account_history
    end

    assert_redirected_to account_histories_path
  end
end
