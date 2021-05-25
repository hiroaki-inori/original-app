class AddLikePointToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :like_point, :integer, default: 0
  end
end
