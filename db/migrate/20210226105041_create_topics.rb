class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.integer :percentage_of_understanging
      t.timestamps
    end
  end
end
