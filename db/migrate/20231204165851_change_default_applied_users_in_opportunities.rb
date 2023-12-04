class ChangeDefaultAppliedUsersInOpportunities < ActiveRecord::Migration
  def change
    change_column_default :opportunities, :applied_users, 0
  end
end
