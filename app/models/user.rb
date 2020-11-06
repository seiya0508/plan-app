class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :garbages

  with_options presence: true do
    validates :nick_kname
    validates :full_name
    validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }
    validates :password, format: { with: /\A[a-z0-9]+\z/ }
  end
end
