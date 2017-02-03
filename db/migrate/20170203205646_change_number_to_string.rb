class ChangeNumberToString < ActiveRecord::Migration[5.0]
  def change
    change_column :people, :number, :string
  end
end
