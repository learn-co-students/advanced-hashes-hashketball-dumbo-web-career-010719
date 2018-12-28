require "pry"

def game_hash
  game_hash = {
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
        }
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |team_location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if name == player_name
        return player_stats[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team_location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if name == player_name
        return player_stats[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |team_location, team_data|
    if team == team_data[:team_name]
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |team_location, team_data|
    game_hash[team_location][:team_name]
  end
end

def player_numbers(team)
  numbers_array = []
  game_hash.each do |team_location, team_data|
    if team == game_hash[team_location][:team_name]
      game_hash[team_location][:players].each do |player_name, player_stats|
        numbers_array << player_stats[:number]
      end
    end
  end
  numbers_array
end

def player_stats(name)
  game_hash.each do |team_location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name == name
        return player_data
      end
    end
  end
end

def big_shoe_rebounds
  big_shoes = 0
  rebounds = 0
  game_hash.each do |team_location, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_data[:shoe] > big_shoes
        big_shoes = player_data[:shoe]
        rebounds = player_data[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  player = ""
  game_hash.each do |team_location, team_data|
    team_data[:players].each do |player_name, player_data|
      if most_points < player_data[:points]
        player = player_name
        most_points = player_data[:points]
      end
    end
  end
  player
end

def winning_team
  away_total = 0
  home_total = 0
    game_hash[:away][:players].each do |player_name, player_data|
      away_total += player_data[:points]
    end
    game_hash[:home][:players].each do |player_name, player_data|
      home_total += player_data[:points]
    end
    if away_total > home_total
      game_hash[:away][:team_name]
    elsif away_total < home_total
      game_hash[:home][:team_name]
    else
      "It's a tie!"
    end
end

def player_with_longest_name(game_hash)

end
