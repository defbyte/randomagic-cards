require "mtg_sdk"

namespace :sets do

  desc "Request all sets from MTG API, and index locally"
  task :sync => :environment do


    sets = MTG::Set.all

    # Iterate over cards from API, request a named-based card ID,
    # find or create using this unique_id
    sets.each do |set_data|
      set = CardSet.find_or_create_by(code: set_data.code, name: set_data.name)
      set.type = set_data.type
      set.border = set_data.border
      set.block = set_data.block

      set.magic_cards_info_code = set_data.magic_cards_info_code
      set.gatherer_code = set_data.gatherer_code

      set.online_only = set_data.online_only ? true : false

      set.release_date = Date.strptime(set_data.release_date)

      set.save!
    end

    puts "Database contains #{CardSet.count} set."
  end

end
