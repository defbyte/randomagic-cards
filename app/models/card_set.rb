class CardSet < ApplicationRecord

  # so that we can have "type" field
  self.inheritance_column = :not_used

  has_many :printings
end
