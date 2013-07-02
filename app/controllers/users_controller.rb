class UsersController < ApplicationController
  def index
    # @users = User.by_karma.limit(50)
    # @users = User.page(params[:page].to_i)
    @users = User.by_karma.paginate(:page => params[:page], :per_page => 50)
  end
end
