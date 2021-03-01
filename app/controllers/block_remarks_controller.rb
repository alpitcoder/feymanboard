class BlockRemarksController < ApplicationController
  before_action :find_user

  def create
    @block_remarks = BlockRemark.where(block_id: params[:block_id], user_id: @current_user.id)
    if @block_remarks.present?
      @block_remarks.update(status: params[:status])
    else
      BlockRemark.create(block_id: params[:block_id], user_id: @current_user.id,status: params[status])
    end
    render status: ok, json: {}
  end

  private

    def find_user
      @current_user = User.find_by_id(params[:user_id])
    end

end
