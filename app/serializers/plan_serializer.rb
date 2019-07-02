class PlanSerializer < ActiveModel::Serializer
  attributes :id, :creator_id, :name, :cost, :pool, :end

  has_many :entries
  has_many :users, through: :entries
end
