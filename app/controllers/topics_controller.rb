class TopicsController < ApplicationController
  before_action :find_user, only: [:create,:show,:index]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @topic = Topic.includes(blocks: :block_remarks).where(id: params[:topic_id]).take
    # @block_remarks = @topic.blocks.block_remarks.where(user_id: @current_user.id)
  end

  def create
    @topic = @current_user.topics.new(topic_params)
    if @topic.save
      redirect_to user_topics_path
    else
      render :new
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :content)
    end

    def find_user
      @current_user = User.find_by_id(params[:user_id])
    end

end
