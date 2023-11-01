class AddProfessorNameToOpportunities < ActiveRecord::Migration
    def change
      add_column :opportunities, :professor_name, :string
    end
  end
  