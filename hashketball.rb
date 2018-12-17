def game_hash
  {
    :home=> {
      :team_name=> "Brooklyn Nets",
      :colors=> ["Black", "White"],
      :players=> {
        "Alan Anderson"=> {
          :number=> 0,
          :shoe=> 16,
          :points=> 22,
          :rebounds=> 12,
          :assists=> 12,
          :steals=> 3,
          :blocks=> 1,
          :slam_dunks=> 1
        },
        "Reggie Evans"=> {
          :number=> 30,
          :shoe=> 14,
          :points=> 12,
          :rebounds=> 12,
          :assists=> 12,
          :steals=> 12,
          :blocks=> 12,
          :slam_dunks=> 7

        },
        "Brook Lopez"=> {
          :number=> 11,
          :shoe=> 17,
          :points=> 17,
          :rebounds=> 19,
          :assists=> 10,
          :steals=> 3,
          :blocks=> 1,
          :slam_dunks=> 15
        },
        "Mason Plumlee"=> {
          :number=> 1,
          :shoe=> 19,
          :points=> 26,
          :rebounds=> 12,
          :assists=> 6,
          :steals=> 3,
          :blocks=> 8,
          :slam_dunks=> 5
        },
        "Jason Terry"=> {
          :number=> 31,
          :shoe=> 15,
          :points=> 19,
          :rebounds=> 2,
          :assists=> 2,
          :steals=> 4,
          :blocks=> 11,
          :slam_dunks=> 1
        }
      }
    },
    :away=> {
      :team_name=> "Charlotte Hornets",
      :colors=> ["Turquoise", "Purple"],
      :players=> {
        "Jeff Adrien"=> {
          :number=> 4,
          :shoe=> 18,
          :points=> 10,
          :rebounds=> 1,
          :assists=> 1,
          :steals=> 2,
          :blocks=> 7,
          :slam_dunks=> 2
        },
        "Bismak Biyombo"=> {
          :number=> 0,
          :shoe=> 16,
          :points=> 12,
          :rebounds=> 4,
          :assists=> 7,
          :steals=> 7,
          :blocks=> 15,
          :slam_dunks=> 10

        },	
        "DeSagna Diop"=> {
          :number=> 2,
          :shoe=> 14,
          :points=> 24,
          :rebounds=> 12,
          :assists=> 12,
          :steals=> 4,
          :blocks=> 5,
          :slam_dunks=> 5
        },	
        "Ben Gordon"=> {
          :number=> 8,
          :shoe=> 15,
          :points=> 33,
          :rebounds=> 3,
          :assists=> 2,
          :steals=> 1,
          :blocks=> 1,
          :slam_dunks=> 0
        },	
        "Brendan Haywood"=> {
          :number=> 33,
          :shoe=> 15,
          :points=> 6,
          :rebounds=> 12,
          :assists=> 12,
          :steals=> 22,
          :blocks=> 5,
          :slam_dunks=> 12

        }
      }
    }
  }
end

def num_points_scored(player)
  if game_hash[:home][:players].keys.include?(player)
    return game_hash[:home][:players][player][:points]
  elsif game_hash[:away][:players].keys.include?(player)
    return game_hash[:away][:players][player][:points]
  end
end

def shoe_size(player)
  if game_hash[:home][:players].keys.include?(player)
    return game_hash[:home][:players][player][:shoe]
  elsif game_hash[:away][:players].keys.include?(player)
    return game_hash[:away][:players][player][:shoe]
  end
end

def team_colors(team)
  if game_hash[:home][:team_name]==team
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name]==team
    return game_hash[:away][:colors]
  end
end

def team_names
  game_hash.values.map do |value|
    value[:team_name]
  end
end

def player_numbers(team)
  # ask how to reformat nested each loops to use .map
  result = []
  game_hash.values.each do |team_hash|
    if team_hash[:team_name] == team
      team_hash[:players].values.each do |stat_hash|
        result << stat_hash[:number]
      end
    end
  end
  return result
end

def player_stats(player)
  if game_hash[:home][:players].keys.include?(player)
    return game_hash[:home][:players][player]
  elsif game_hash[:away][:players].keys.include?(player)
    return game_hash[:away][:players][player]
  end

end

def big_shoe_rebounds
  greatest = nil
  index = nil
  shoes = []
  rebounds = []
  
  game_hash.values.each do |hash1|
    hash1[:players].keys.each do |player|
      shoes << hash1[:players][player][:shoe]
      rebounds << hash1[:players][player][:rebounds]
    end
  end
  shoes.each_with_index do |ele, idx|
    if greatest == nil || ele > greatest
      greatest = ele
      index = idx
    end
  end

  return rebounds[index]
end

def most_points_scored
  counter = Hash.new(0)
  game_hash.values.each do |hash1|
    hash1[:players].keys.each do |player|
      counter[player] += hash1[:players][player][:points]
    end
  end

  return counter.key(counter.values.max)
end

def winning_team
  counter = Hash.new(0)
  game_hash.values.each do |info_hash|
    info_hash[:players].values.each do |stats_hash|
      counter[info_hash[:team_name]] += stats_hash.fetch(:points)
    end
  end
  return counter.key(counter.values.max)
end

def player_with_longest_name
  counter = Hash.new(0)
  game_hash.values.each do |info_hash|
    info_hash[:players].keys.each do |player_name|
      counter[player_name] = player_name.length
    end
  end
  return counter.key(counter.values.max)
end

def long_name_steals_a_ton?
  name_and_steals = Hash.new()
  game_hash.values.each do |info_hash|
    info_hash[:players].each do |name, stats|
      name_and_steals[name] = stats[:steals]
    end
  end
#for this to be true, every person with a longer name should steal more than a shorter name person
  # previous = 0
  # name_and_steals.sort_by {|k,v| k.length}.each do |sorted|
  #   return false if sorted[1] < previous
  #   previous = sorted[1]
  # end
  # true
  return name_and_steals.values.max == name_and_steals[player_with_longest_name]
end