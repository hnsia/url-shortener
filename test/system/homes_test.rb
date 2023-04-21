require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  include ActionDispatch::Assertions::ResponseAssertions
  test "visiting the index" do
    visit root_url
  
    assert_selector "h1", text: "Welcome to HNS' URL Shortener!"
  end
end
