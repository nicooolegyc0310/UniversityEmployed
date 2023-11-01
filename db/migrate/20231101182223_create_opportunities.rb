class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :title
      t.string :professors_name
      t.string :department
      t.text :description
      t.string :contact
      t.text :requirements
      t.string :duration
      t.timestamps null: false
    end
  end
end
