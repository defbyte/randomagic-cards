class AddOracleAndFlavorTextToPrintings < ActiveRecord::Migration[5.0]
  def change
    add_column :printings, :oracle_text, :text
    add_column :printings, :flavor_text, :text
  end
end
