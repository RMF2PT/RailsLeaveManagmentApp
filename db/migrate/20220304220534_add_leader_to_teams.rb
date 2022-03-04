class AddLeaderToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :leader, :integer
  end
end
