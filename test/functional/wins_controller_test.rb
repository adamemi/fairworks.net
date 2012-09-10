require 'test_helper'

class WinsControllerTest < ActionController::TestCase
  setup do
    @win = wins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create win" do
    assert_difference('Win.count') do
      post :create, :win => { :category_id => @win.category_id, :entrant_id => @win.entrant_id, :prize_id => @win.prize_id }
    end

    assert_redirected_to win_path(assigns(:win))
  end

  test "should show win" do
    get :show, :id => @win
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @win
    assert_response :success
  end

  test "should update win" do
    put :update, :id => @win, :win => { :category_id => @win.category_id, :entrant_id => @win.entrant_id, :prize_id => @win.prize_id }
    assert_redirected_to win_path(assigns(:win))
  end

  test "should destroy win" do
    assert_difference('Win.count', -1) do
      delete :destroy, :id => @win
    end

    assert_redirected_to wins_path
  end
end
