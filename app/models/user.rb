class User < ApplicationRecord
  has_many :foils, dependent: :nullify

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable
  #  :omniauthable

  def username
    email.split('@').first
  end
end
