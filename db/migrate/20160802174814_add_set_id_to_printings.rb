class AddSetIdToPrintings < ActiveRecord::Migration[5.0]
  def change
    add_column :printings, :card_set_id, :integer, index: true
  end
end
