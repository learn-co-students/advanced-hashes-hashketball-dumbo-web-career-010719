# Write your code here!
def game_hash
  {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => {
        "Alan Anderson" => {
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
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
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
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |key, value|
    value.each do |k, v|
      if k === :players
        v.each do |ka, va|
          if ka === player_name
            va.each do |key, val|
              if key === :points
                return val
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |key, value|
    value.each do |k, v|
      if k === :players
        v.each do |ka, va|
          if ka === player_name
            va.each do |key, val|
              if key === :shoe
                return val
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |key, value|
    value.each do |k, v|
      if k === :team_name
        if v === team_name
          return game_hash[key][:colors]
        end
      end
    end
  end
end

def team_names
  team_name_array = []
  game_hash.each do |key, value|
    value.each do |k, v|
      if k === :team_name
        team_name_array << v
      end
    end
  end
  team_name_array
end

def player_numbers(team_name)
  player_numbers_array = []
  game_hash.each do |key, value|
    value.each do |k, v|
      if k === :team_name
        if v === team_name
          value[:players].each do |key, val|
            val.each do |key, val|
              if key === :number
                player_numbers_array << val
              end
            end
          end
        end
      end
    end
  end
  player_numbers_array
end

def player_stats(player_name)
  player_stat_hash = {}
  game_hash.each do |key, value|
    value.each do |k, v|
      if k === :players
        v.each do |ka, va|
          if ka === player_name
            va.each do |k, v|
              player_stat_hash[k] = v
            end
          end
        end
      end
    end
  end
  player_stat_hash
end

def big_shoe_rebounds
  max_shoe_size = "xxx"
  rebounds_for_max_shoe = "xxx"
  
  game_hash.each do |k1, v1|
    v1.each do |k2, v2|
      if k2 === :players
        v2.each do |k3, v3|
          v3.each do |k4, v4|
            if k4 === :shoe 
              if max_shoe_size === 'xxx'
                max_shoe_size = v4
                rebounds_for_max_shoe = game_hash[k1][k2][k3][:rebounds]
              elsif v4 > max_shoe_size 
                max_shoe_size = v4
               # puts "k1 = #{k1}"
               # puts "k2 = #{k2}"
               # puts "k3 = #{k3}"
                rebounds_for_max_shoe = game_hash[k1][k2][k3][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  return rebounds_for_max_shoe
end 

