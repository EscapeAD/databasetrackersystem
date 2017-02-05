class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :start
      t.date :end
      t.string :contact
      t.string :location

      t.timestamps
    end
  end
end
