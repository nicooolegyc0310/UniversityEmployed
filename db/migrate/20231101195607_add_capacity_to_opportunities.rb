class AddCapacityToOpportunities < ActiveRecord::Migration
    def change
      add_column :opportunities, :capacity, :integer
    end
  end
  