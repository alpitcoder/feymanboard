class AddReferenceToBlockRemark < ActiveRecord::Migration[6.0]
  def change
    add_reference :block_remarks, :user, index: true, foreign_key: true
  end
end
