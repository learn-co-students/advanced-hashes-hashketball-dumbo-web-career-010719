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

def get_player_keys
  game_hash.values.map do |team_hash|
    team_hash[:players].keys
  end.flatten
end

def get_player_values
  game_hash.values.map do |team_hash|
    team_hash[:players].values
  end.flatten
end

def get_all_players(player = nil)
  new_hash = {}
  i = 0
  while i < get_player_keys.length
    new_hash[get_player_keys[i]] = get_player_values[i]
    i += 1
  end
  if player == nil
    return new_hash
  elsif new_hash[player]
    return new_hash[player]
  else
    return "Name does not exist."
  end
end

def team_info
  new_hash = {}
  game_hash.values.each do |hash1|
    new_hash[hash1[:team_name]] = hash1[:players]
  end
  return new_hash
end

# ^ helper methods

def num_points_scored(player)
  get_all_players(player)[:points]
end

def shoe_size(player)
  get_all_players(player)[:shoe]
end

def team_colors(team)
  game_hash.values.each {|x| return x[:colors] if x[:team_name] == team}
end

def team_names
  return team_info.keys
end

def player_numbers(team)
  team_info[team].values.map {|x| x[:number]}
end

def player_stats(player)
  get_all_players(player)
end

def big_shoe_rebounds
  counter = Hash.new(0)
  rebounds = {}
  get_all_players.each do |player, hash1|
    counter[player] += hash1[:shoe]
    rebounds[player] = hash1[:rebounds]
  end
  return rebounds[counter.key(counter.values.max)]
end

def most_points_scored
  counter = Hash.new(0)
  get_all_players.each{|player, hash1| counter[player] += hash1[:points]}
  return counter.key(counter.values.max)
end

def winning_team
  counter = Hash.new(0)
  team_info.each do |team, player_stats|
    player_stats.values.each do |ele|
      counter[team] += ele[:points]
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