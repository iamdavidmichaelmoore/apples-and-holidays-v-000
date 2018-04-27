require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  #holiday_supplies[:summer][:fourth_of_july][1]
  match = nil
  holiday_hash.each do |season, seasons_hash|
    seasons_hash.each do |holiday, supply_array|
      if holiday == :fourth_of_july
        match = supply_array[1]
      end
    end
  end
  match
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, seasons_hash|
    seasons_hash.each do |holiday, supply_array|
      if season == :christmas || :new_years
        supply_array << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, seasons_hash|
    seasons_hash.each do |holiday, supply_array|
      if holiday == :memorial_day
        supply_array << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, this_season, holiday_name, supply_array)
  holiday_hash[this_season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc
  holiday_hash.each do |season, seasons_hash|
      puts "#{season.to_s.capitalize}:"
    #end
    seasons_hash.each do |holiday, supply|
      if !(holiday.to_s.include?("_"))
        stringifi = supply.join(", ")
        puts "  #{holiday.to_s.capitalize}: #{stringifi}"
      elsif holiday.to_s.include?("_")
        stringifi = supply.join(", ")
        splitifi = holiday.to_s.split("_")
        all_capped = []
        capped_stringified = ""
        splitifi.each do |cap_first|
          all_capped << cap_first.capitalize
          capped_stringified = all_capped.join(" ")
        end
        #new_capitalized = holiday.to_s.split("_")[0].capitalize
        #years_capitlized = holiday.to_s.split("_")[1].capitalize
        puts "  #{capped_stringified}: #{stringifi}"
      end
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.each do |season, seasons_hash|
    seasons_hash.each do |holiday, supply_array|
      if supply_array.include?("BBQ")
        holiday
      end
    end
  end
  holiday
end
