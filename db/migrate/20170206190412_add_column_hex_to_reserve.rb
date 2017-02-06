class AddColumnHexToReserve < ActiveRecord::Migration[5.0]
  def change
    add_column :reserves, :event_hex, :string
  end
end
