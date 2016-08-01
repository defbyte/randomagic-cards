class AddOracleTextToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :oracle_text, :text
    remove_column :printings, :oracle_text, :text
  end
end
