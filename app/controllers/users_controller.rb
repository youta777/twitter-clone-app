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

  # ユーザ登録確認
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash[:danger] = 'ユーザの登録が失敗しました。'
      render :new
    end
  end
end

private

# Strong Parameter
def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
