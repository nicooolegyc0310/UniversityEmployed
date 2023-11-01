class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :opportunity, null: false, foreign_key: true
      t.string :status, default: 'pending'
      t.timestamps null: false
    end
  end
end

  