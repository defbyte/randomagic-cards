require "mtg_sdk"

namespace :cards do

  desc "Request all card printings from MTG API, and index locally"
  task :sync => :environment do

    # This will take a while to get all cards
    # TODO: refactor to work in batches?
    cards = MTG::Card.all

    # Iterate over cards from API, request a named-based card ID,
    # find or create using this unique_id
    cards.each do |api_card|
      unique_id = Card.generate_unique_id(api_card.name)
      card = Card.find_or_create_by(unique_id: unique_id)

      # Only create a Printing entry if the api_card has a multiverse_id
      if api_card.multiverse_id.present?
        printing = Printing.find_or_create_by(multiverse_id: api_card.multiverse_id, card_id: card.id)
        printing.image_url = api_card.image_url
        printing.flavor_text = api_card.flavor
        printing.save!
      end

      # Update the card's oracle_text if it exists and if it differs from what is already stored.
      if api_card.text.present? && card.oracle_text != api_card.text
        card.oracle_text = api_card.text
      end

      # Save changes to the card record
      # TODO: Add a check so that we are not unnessarily saving?
      card.name = api_card.name
      card.save!
    end

    puts "Database contains #{Card.count} cards and #{Printing.count} printings"
  end

end
