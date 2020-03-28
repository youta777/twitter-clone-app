class UsersController < ApplicationController
  # ユーザ一覧 :ページネーション適用
  def index
    @users = User.all.page(params[:page])
  end

  # ユーザ詳細ページ
  def show
    @user = User.find(params[:id])
  end

  # ユーザ新規登録ページ
  def new
    @user = User.new
  end

  def create
  end
end
