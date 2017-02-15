# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates: :username, presence: true, uniqueness: true
  validates: :password_digest, presence: { message: "Password can't be blank" }
  validates: :session_token, presence: true, uniqueness: true
  validates: :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  attr_reader :password


  def find_by_credentials(username, password)
    user = User.find_by(username: username)
  end

  def generate_session_token
  end

  def reset_session_token!
  end

  def ensure_session_token
  end

  def password=
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
