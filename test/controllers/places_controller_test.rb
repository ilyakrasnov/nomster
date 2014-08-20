require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  test "index" do
    place1 = FactoryGirl.create(:place)
    place2 = FactoryGirl.create(:place)
	place3 = FactoryGirl.create(:place)
	place4 = FactoryGirl.create(:place, :name => "Blu")
    place5 = FactoryGirl.create(:place)

    get :show, :id => place4.id

    assert_response :success
  end
end
