class CreateReserves < ActiveRecord::Migration[5.0]
  def change
    create_table :reserves do |t|
      t.references :event, foreign_key: true
      t.references :person, foreign_key: true
      t.boolean :ticket, default: false

      t.timestamps
    end
  end
end
