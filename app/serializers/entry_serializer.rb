class EntrySerializer < ActiveModel::Serializer
  attributes :id, :wager, :payout, :attending, :plan_id, :user_id
end
