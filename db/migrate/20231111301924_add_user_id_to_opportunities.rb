class AddUserIdToOpportunities < ActiveRecord::Migration
  def change
    add_reference :opportunities, :created_by, foreign_key: { to_table: :users }
  end
end