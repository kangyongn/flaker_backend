class Plan < ApplicationRecord
  has_many :entries
  has_many :users, through: :entries

  belongs_to :creator, class_name: :User, foreign_key: :creator_id

  def pool
    entries = self.entries.select{|entry| entry.attending === true}
    entries.map{|entry| entry.wager}.reduce(:+)
  end
end
