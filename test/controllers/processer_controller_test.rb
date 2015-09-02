require 'test_helper'

class ProcesserControllerTest < ActionController::TestCase
  test "should get collectdata" do
    get :collectdata
    assert_response :success
  end

end
