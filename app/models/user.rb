class User < ApplicationRecord
    has_secure_password
    attr_accessor :activation_token
      # 引数のハッシュ値を返す
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムトークン生成
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # 有効化トークンとダイジェストを作成及び代入
  def create_activation_digest
    self.activation_token  = self.class.new_token
    self.activation_digest = self.class.digest(activation_token)
  end

  # トークンがダイジェストと一致したらtrueを返す
  def authenticated?(activation_token)
    return false if activation_digest.nil?
    BCrypt::Password.new(activation_digest).is_password?(activation_token)
  end
end
