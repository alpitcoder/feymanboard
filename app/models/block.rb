class Block < ApplicationRecord
  belongs_to :topic
  has_many :block_remarks

end
