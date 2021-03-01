class CreateBlockRemarks < ActiveRecord::Migration[6.0]
  def change
    create_table :block_remarks do |t|
      t.integer :status
      t.references :block, index: true, foreign_key: true

      t.timestamps
    end
  end
end
