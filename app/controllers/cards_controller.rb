class CardsController < ApplicationController

  def random
    @card = Card.order("RANDOM()").first
  end

end
