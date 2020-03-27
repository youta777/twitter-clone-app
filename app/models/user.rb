class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
end

=begin
  has_secure_passwordでできること(password_digestカラムが必要)
  - users テーブルにパスワードを保存するとき、パスワードを暗号化して保存する。
  - ログインフォーム用に password と password_confirmation という変数をモデルに追加して、ログイン認証時のパスワード確認のために使用する。password と password_confirmation には平文のパスワードが代入されるが、users テーブルのカラムではない一時的な変数として扱われるので、保存はされない。
  - ログイン認証用のメソッド authenticate を提供する。
=end
