require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "test comments" do
    comment = FactoryGirl.create(:comment)
    puts comment.place.inspect
  end
end
