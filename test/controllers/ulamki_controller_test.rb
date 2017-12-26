require 'test_helper'

class UlamkiControllerTest < ActionController::TestCase
  test "should get dzialanie" do
    get :dzialanie
    assert_response :success
  end

  test "should get wynik" do
    get :wynik
    assert_response :success
  end

end
