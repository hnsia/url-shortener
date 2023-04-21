require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url = urls(:four)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should be able to redirect using short url and track the visitation click" do
    assert_difference("Visit.count") do
      get "#{root_url}#{@url.shortened_key}"
    end

    assert_redirected_to @url.target_url
  end
end
