class CreateOpportunities < ActiveRecord::Migration
  def up
    create_table :opportunities do |t|
      t.string :title
      t.string :professors_name
      t.string :department
      t.text :description
      t.string :contact
      t.text :requirements
      t.string :duration
      # Add fields that let Rails automatically keep track
      # of when opportunities are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table :opportunities
  end
end
