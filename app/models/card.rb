require "digest"

class Card < ApplicationRecord

  def self.generate_unique_id(card_name)
    Digest::MD5.hexdigest(card_name).to_i(16)
  end

  has_many :printings

end
