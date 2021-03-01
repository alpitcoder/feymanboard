class BlockRemark < ApplicationRecord
  belongs_to :block
  belongs_to :user

  enum status: %i[what_rubbish not_clear somewhat_understood understood]

end
