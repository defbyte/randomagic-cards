class CreateSets < ActiveRecord::Migration[5.0]
  def change
    create_table :card_sets do |t|
      t.string :code, null:false, index:true
      t.string :name, null:false
      t.string :type, index:true
      t.string :border, index:true
      t.boolean :online_only, default:false, index:true
      t.string :block
      t.string :magic_cards_info_code, index:true
      t.string :gatherer_code, index:true
      t.datetime :release_date
    end
  end
end
