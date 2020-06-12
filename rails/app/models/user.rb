class User < ApplicationRecord
  # データを保存する前に実行する
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  # Rubyの標準ライブラリのURIにメールアドレスの正規表現が用意されているのでそれをformatのwithオプションに指定してあげる。
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: URI::MailTo::EMAIL_REGEXP },
  uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
