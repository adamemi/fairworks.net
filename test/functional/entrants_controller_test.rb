require 'test_helper'

class EntrantsControllerTest < ActionController::TestCase
  setup do
    @entrant = entrants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entrants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entrant" do
    assert_difference('Entrant.count') do
      post :create, :entrant => { :address_city => @entrant.address_city, :address_line_1 => @entrant.address_line_1, :address_line_2 => @entrant.address_line_2, :address_state => @entrant.address_state, :address_zip_code => @entrant.address_zip_code, :email_address => @entrant.email_address, :for_year => @entrant.for_year, :name_first => @entrant.name_first, :name_last => @entrant.name_last, :name_middle => @entrant.name_middle, :phone_alternate => @entrant.phone_alternate, :phone_primary => @entrant.phone_primary }
    end

    assert_redirected_to entrant_path(assigns(:entrant))
  end

  test "should show entrant" do
    get :show, :id => @entrant
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @entrant
    assert_response :success
  end

  test "should update entrant" do
    put :update, :id => @entrant, :entrant => { :address_city => @entrant.address_city, :address_line_1 => @entrant.address_line_1, :address_line_2 => @entrant.address_line_2, :address_state => @entrant.address_state, :address_zip_code => @entrant.address_zip_code, :email_address => @entrant.email_address, :for_year => @entrant.for_year, :name_first => @entrant.name_first, :name_last => @entrant.name_last, :name_middle => @entrant.name_middle, :phone_alternate => @entrant.phone_alternate, :phone_primary => @entrant.phone_primary }
    assert_redirected_to entrant_path(assigns(:entrant))
  end

  test "should destroy entrant" do
    assert_difference('Entrant.count', -1) do
      delete :destroy, :id => @entrant
    end

    assert_redirected_to entrants_path
  end
end
