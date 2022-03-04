class RemoveLeaderFromTeams < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :leader, :integer
  end
end
