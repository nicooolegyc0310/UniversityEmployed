class AddAppliedUsersToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :applied_users, :integer
  end
end
