require "test_helper"

class UrlTest < ActiveSupport::TestCase
  test "should not save url without target url" do
    url = Url.new
    url.shortened_key = "1234567890"
    url.title = "test1234"
    assert_not url.save, "Able to save the url without a target url"
  end

  test "should not save url when target url is not a valid url" do
    url = Url.new
    url.target_url = "invalid url"
    url.shortened_key = "1234567890"
    url.title = "test1234"
    assert_not url.save, "Able to save the url without a valid target url"
  end

  test "should not save url without shortened key" do
    url = Url.new
    url.target_url = "https://guides.rubyonrails.org/"
    url.title = "test4321"
    assert_not url.save, "Able to save the url without a shortened key"
  end
  
  test "should not save url with non-unique shortened key" do
    url = Url.new
    url.target_url = "https://guides.rubyonrails.org/"
    url.shortened_key = urls(:two).shortened_key # "529731fb77"
    url.title = "test4321"
    assert_not url.save, "Able to save the url with an existing shortened key"
  end

  test "should not save url when shortened key is not of length 10-15" do
    url = Url.new
    url.target_url = "https://guides.rubyonrails.org/"
    url.shortened_key = "123456"
    url.title = "test4321"
    assert_not url.save, "Able to save the url with shortened key under the min limit of 10"

    url = Url.new
    url.target_url = "https://guides.rubyonrails.org/"
    url.shortened_key = "12345678910123456"
    url.title = "test1234"
    assert_not url.save, "Able to save the url with shortened key over the max limit of 15"
  end

  test "should save url with correct params" do
    url = Url.new
    url.target_url = "https://guides.rubyonrails.org/"
    url.shortened_key = "1234567890"
    url.title = "Ruby on Rails guide"
    assert url.save, "Unable to save the url with correct params"
  end
end
