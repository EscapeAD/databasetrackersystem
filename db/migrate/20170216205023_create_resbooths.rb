class CreateResbooths < ActiveRecord::Migration[5.0]
  def change
    create_table :resbooths do |t|
      t.references :booth, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
