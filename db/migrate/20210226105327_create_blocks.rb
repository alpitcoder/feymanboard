class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.text :value
      t.references :topic, index: true, foreign_key: true

      t.timestamps
    end
  end
end
