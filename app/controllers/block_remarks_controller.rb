class BlockRemarksController < ApplicationController
  before_action :find_user, only: [:create,:show,:index]

  def create
    @block_remarks = BlockRemark.where(block_id: params[:block_id], user_id: @current_user.id)
    if @block_remarks.present?
      @block_remarks.update
    else
      @block_remarks.create
    end
    render status: ok, json: {}
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :content)
    end

    def find_user
      @current_user = User.find_by_id(params[:user_id])
    end

end
