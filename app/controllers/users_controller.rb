class UsersController < ApplicationController
  # ユーザ一覧 :ページネーション適用
  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def new
  end

  def create
  end
end
