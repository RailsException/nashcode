require 'test_helper'

class ResultsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get battingavg" do
    get :battingavg
    assert_response :success
  end

  test "should get slugging" do
    get :slugging
    assert_response :success
  end

  test "should get crownwinner" do
    get :crownwinner
    assert_response :success
  end

end
