class ChangeRatingType < ActiveRecord::Migration
  def up
    change_column :comments, :rating, 'integer USING CAST(rating AS integer)'
  end

  def down
    change_column :comments, :rating, :string
  end
end
