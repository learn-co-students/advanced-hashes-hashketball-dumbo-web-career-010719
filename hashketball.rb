# Write your code here!
require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
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
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        },
      }
    }

  }
end

def num_points_scored player_name
  # game_hash[:away][:players]["Jeff Adrien"][:points]
  #return  v1[:players][p][:points]
  game_hash.each do |t, v1|
    v1[:players].each do |p, v2|
      if p == player_name
        return v2[:points]
      end
    end
  end
end


def shoe_size player_name
# knows the shoe size of each player
game_hash.each do |t, v1|
  v1[:players].select do |p, v2|
    if p == player_name
      return v2[:shoe]
    end
  end
 end
end

def team_colors team_name
  game_hash.select do |t, v1|
    if v1[:team_name] == team_name
      return v1[:colors]
    end
  end
end

def team_names
  game_hash.collect do |t, v1|
    v1[:team_name]
  end
end

def player_numbers team_name
  pNums = []
  game_hash.each do |t, v1|
    if v1[:team_name] == team_name
      v1[:players].collect do |p, v2|
        pNums.push(v2[:number])
      end
    end
  end
  pNums.sort
end


def player_stats player_name
  game_hash.each do |t, v1|
    v1[:players].each do |p, v2|
      if p == player_name
        return v2
      end
    end
  end
end

def big_shoe_rebounds
  # returns the number of rebounds of the player with the biggest shoe size
  shoes = {}

  game_hash.each do |t, v1|
    v1[:players].each do |p, v2|
      shoes[p] = v2[:shoe]
      end
    end

    playerArr = shoes.max_by {|k,v| v}
    player = playerArr[0]

    game_hash.each do |t, v1|
      v1[:players].select do |p, v2|
        if p == player
          return v2[:rebounds]
        end
      end
     end
end


# Which player has the most points? Call the method most_points_scored.

def most_points_scored
  points = {}

  game_hash.each do |t, v1|
    v1[:players].each do |p, v2|
      points[p] = v2[:points]
      end
    end
    playerArr = points.max_by {|k,v| v}
    player = playerArr[0]
end

# Which team has the most points? Call the method winning_team.

def winning_team
  home = []
  away = []

  game_hash[:home][:players].each do |p, v1|
    home.push(v1[:points])
  end
  game_hash[:away][:players].each do |p, v1|
    home.push(v1[:points])
  end

  if home.inject {|sum, n| sum + n} > home.inject {|sum, n| sum + n}
    game_hash[:home][:team_name]
  else
    game_hash[:home][:team_name]
  end
end

# Which player has the longest name? Call the method player_with_longest_name.

def player_with_longest_name
  names = []
  game_hash.each do |t, v1|
    v1[:players].each do |p, v2|
      names.push(p)
      end
    end
    player = names.max_by(&:length)
end

# Write a method that returns true if the player with the longest name had the most steals. Call the method long_name_steals_a_ton?.

def long_name_steals_a_ton?
  longName = player_with_longest_name
  longNameSteals = ""
  stealsArr =[]

  game_hash.each do |t, v1|
    if v1[:players].include?(longName)
      longNameSteals = v1[:players][longName][:steals]
    end
  end

  game_hash.each do |t, v1|
    v1[:players].each do |p, v2|
      stealsArr.push(v2[:steals])
    end
  end

  longNameSteals >= stealsArr.max ? true : false

end
