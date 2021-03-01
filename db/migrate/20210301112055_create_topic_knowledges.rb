class CreateTopicKnowledges < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_knowledges do |t|
      t.references :topic, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :percentage_of_understanging
      t.timestamps
    end
  end
end
