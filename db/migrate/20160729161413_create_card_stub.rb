class CreateCardStub < ActiveRecord::Migration[5.0]
  def change

    create_table :cards do |t|
      t.string :unique_id, index:true
      t.string :name, index:true
    end

    create_table :printings do |t|
      t.integer :card_id, null: false, index:true
      t.string :multiverse_id, index:true
      t.text :image_url
    end

  end
end
