class AddApplicationTextAndResumeToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :application_text, :text
    add_column :applications, :resume, :string 

    # Optionally, you may want to add an index on opportunity_id for better query performance
    add_index :applications, :opportunity_id
  end
end