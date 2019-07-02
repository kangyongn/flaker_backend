class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :stripe_id

  has_many :entries
  has_many :plans, through: :entries
end
