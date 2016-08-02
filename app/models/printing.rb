class Printing < ApplicationRecord

  # Represents a printing of a Magic: The Gathering card
  has_one :card
  belongs_to :card_set

end
