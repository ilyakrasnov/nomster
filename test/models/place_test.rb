require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test "to_s" do
    place = Place.new(:name => "Bla", :address => "Marienplatz 1")

  	expected = "Bla, Marienplatz 1"

  	assert_equal expected, place.to_s
  end
end
