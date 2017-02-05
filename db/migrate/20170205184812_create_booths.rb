class CreateBooths < ActiveRecord::Migration[5.0]
  def change
    create_table :booths do |t|
      t.references :event, foreign_key: true
      t.string :name
      t.date :start
      t.date :end
      t.string :sponser

      t.timestamps
    end
  end
end
