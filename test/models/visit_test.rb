require "test_helper"

class VisitTest < ActiveSupport::TestCase
  test "should be able to convert coordinates array into string" do
    coords_in_arrform = Geocoder.search("Kuala Lumpur, Malaysia").first.coordinates
    coords_in_strform = Visit.coords_to_str(coords_in_arrform)
    assert_equal coords_in_strform, "3.1516964, 101.6942371", "Conversion from coordinate array into string has failed"
  end

  test "should be able to convert coordinates string into array" do
    coords_in_strform = visits(:one).geocoordinates
    coords_in_arrform = Visit.str_to_coords(coords_in_strform)
    assert_equal coords_in_arrform, [4.2105, 101.9758], "Conversion from coordinate string into array has failed"
  end
end
