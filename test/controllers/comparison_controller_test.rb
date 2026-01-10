require "test_helper"

class ComparisonControllerTest < ActionDispatch::IntegrationTest
  test "should get judge" do
    get comparison_judge_url
    assert_response :success
  end
end
