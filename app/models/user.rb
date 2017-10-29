# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true

  validates :password, length: {minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!

    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

end
