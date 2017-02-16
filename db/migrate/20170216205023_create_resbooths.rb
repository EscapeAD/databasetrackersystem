class CreateResbooths < ActiveRecord::Migration[5.0]
  def change
    create_table :resbooths do |t|
      t.references :booths, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
