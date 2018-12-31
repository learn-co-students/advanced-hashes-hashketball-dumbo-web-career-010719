# Write your code here!
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => { 
        "Alan Anderson" =>{
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, 
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
      
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
          "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }, 
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals =>22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
      
    }
  }
end

def num_points_scored(person)
  arr = []
  game_hash.each do |place, team|
    team.each do |key, values|
      if key == :players
        values.each do |player, stat|
          if player == person
            stat.each do |stat, result|
              if stat == :points
                arr << result
              end
            end
          end
        end 
      end
    end
  end
  return arr[0]
end

def shoe_size(person)
  arr = []
  game_hash.each do |place, team|
    team.each do |key, values|
      if key == :players
        values.each do |player, stat|
          if player == person
            stat.each do |stat, result|
              if stat == :shoe
                arr << result
              end
            end
          end
        end 
      end
    end
  end
  return arr[0]
end

def team_colors(name_of)
  if name_of == "Charlotte Hornets"
    return game_hash[:away][:colors]
  elsif name_of == "Brooklyn Nets"
    return game_hash[:home][:colors]
  end
end

def team_names
  arr = []
  arr << game_hash[:away][:team_name]
  arr << game_hash[:home][:team_name]
  return arr
end

def player_numbers(team_name)
  arr = []
  game_hash.each do |location, attributes| 
    if attributes[:team_name] == team_name
      attributes[:players].each do |player, stats|
        arr << stats[:number]
      end
    end
  end
  return arr  
end

def player_stats(player_name)
  game_hash.each do |location, attributes|
    attributes[:players].each do |names, stats|
      if names == player_name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  shoes = {}
  game_hash.each do |location, attributes|
    attributes[:players].each do |player, stats|
      shoes[player] = stats[:shoe]
      end
    end
    big_shoe_name = shoes.sort_by {|k, v| v} [-1][0]
    game_hash.each do |location, attributes|
      return attributes[:players][big_shoe_name][:rebounds]
    end
end


