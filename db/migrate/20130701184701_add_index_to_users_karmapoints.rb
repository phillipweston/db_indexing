class AddIndexToUsersKarmapoints < ActiveRecord::Migration
  def change
    add_index(:users, :total_karma)
  end
end
