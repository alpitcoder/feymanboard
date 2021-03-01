class User < ApplicationRecord
  has_many :topics
  has_many :block_remarks
end
