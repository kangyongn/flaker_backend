class User < ApplicationRecord
  has_secure_password

  has_many :entries
  has_many :plans, through: :entries

  validates :email, uniqueness: true

  def name
    self.first_name + ' ' + self.last_name
  end
end
