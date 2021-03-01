class Topic < ApplicationRecord
  has_many :blocks
  belongs_to :user

  after_create :save_content_into_blocks

  def save_content_into_blocks
    content = self.content
    block_array = content.split(/(?<=[?.!|,-\/;:])/)
    block_array.each do |block|
      self.blocks.create!(value: block)
    end
  end
end
