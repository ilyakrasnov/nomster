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

  test "generate 404 when showing unknown place_id" do
    place1 = FactoryGirl.create(:place)
    place1.delete()

    get :show, :id => place1.id

    assert_response :not_found
  end

  test "should create place" do
	  assert_difference('Place.count') do
	    post :create, post: {title: 'Some title'}
	  end
	 
	  assert_redirected_to post_path(assigns(:post))
	end  
end
