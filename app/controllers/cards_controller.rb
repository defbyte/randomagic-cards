class CardsController < ApplicationController

  def random
    @card = Card.order("RANDOM()").first

    respond_to do |format|
      format.html
      format.json { render json: @card }
    end
  end

end
