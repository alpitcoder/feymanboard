class BlockRemark < ApplicationRecord
  belongs_to :block
  belongs_to :user

  enum status: %i[what_rubbish not_clear somewhat_understood understood]

  after_save :create_or_update_topic_knowledge


  def update_topic_knowledge
    topic = block.topic
    user = user
    number_of_blocks = topic.blocks.count
    block_ids = topic.blocks.pluck(:id)
    block_remarks_statuses = BlockRemark.where(block_id: block_ids, user_id: user.id).pluck(:status)
    status_values = block_remarks_statuses.map{|block_remarks_status| BlockRemark.statuses[block_remarks_status]}
    understanding_level = (status_values.sum/number_of_blocks*4)*100
    topic_knowledge = TopicKnowledge.where(topic_id: topic.id, user_id: user.id)
    if topic_knowledge.present?
      topic_knowledge.update(percentage_of_understanging: topic_knowledge)
    end
  end

end
