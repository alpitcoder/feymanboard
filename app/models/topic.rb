class Topic < ApplicationRecord
  has_many :blocks
  has_many :topic_knowledges
  belongs_to :user

  after_create :save_content_into_blocks
  after_create :create_topic_knowledge

  def save_content_into_blocks
    content = self.content
    block_array = content.split(/(?<=[?.!|,-\/;:\n])/)
    block_array.each do |block|
      self.blocks.create!(value: block)
    end
  end

  def create_topic_knowledge
    self.topic_knowledges.create!(user_id: self.user_id, percentage_of_understanging: 0)
  end

end
