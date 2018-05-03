class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :location
      t.text :description
      t.datetime :date_event
      t.integer :creator_id

      t.timestamps
    end
  end
end
