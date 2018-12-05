# Write your code here!
require 'pry'
def game_hash
  dict = { 
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => {
        "Alan Anderson" => {
          "number": 0,
          "shoe": 16,
          "points": 22,
          "rebounds": 12,
          "assists": 12,
          "steals": 3,
          "blocks": 1, 
          "slam_dunks": 1
        },
        "Reggie Evans" => {
          "number": 30,
          "shoe": 14,
          "points": 12,
          "rebounds": 12,
          "assists": 12,
          "steals": 12,
          "blocks": 12, 
          "slam_dunks": 7
        },
        "Brook Lopez" => {
          "number": 11,
          "shoe": 17,
          "points": 17,
          "rebounds": 19,
          "assists": 10,
          "steals": 3,
          "blocks": 1, 
          "slam_dunks": 15
        }, 
        "Mason Plumlee" => {
          "number": 1,
          "shoe": 19,
          "points": 26,
          "rebounds": 12,
          "assists": 6,
          "steals": 3,
          "blocks": 8, 
          "slam_dunks": 5
        },
        "Jason Terry" => {
          "number": 31,
          "shoe": 15,
          "points": 19,
          "rebounds": 2,
          "assists": 2,
          "steals": 4,
          "blocks": 11, 
          "slam_dunks": 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"], 
      :players => {
        "Jeff Adrien" => {
          "number": 4,
          "shoe": 18,
          "points": 10,
          "rebounds": 1,
          "assists": 1,
          "steals": 2,
          "blocks": 7, 
          "slam_dunks": 2
        },
        "Bismak Biyombo" => {
          "number": 0,
          "shoe": 16,
          "points": 12,
          "rebounds": 4,
          "assists": 7,
          "steals": 7,
          "blocks": 15, 
          "slam_dunks": 10
        },
        "DeSagna Diop" => {
          "number": 2,
          "shoe": 14,
          "points": 24,
          "rebounds": 12,
          "assists": 12,
          "steals": 4,
          "blocks": 5, 
          "slam_dunks": 5
        },
        "Brendan Haywood" => { 
          "number": 33,
          "shoe": 15,
          "points": 6,
          "rebounds": 12,
          "assists": 12,
          "steals": 22,
          "blocks": 5, 
          "slam_dunks": 12
        },
        "Ben Gordon" => {
          "number": 8,
          "shoe": 15,
          "points": 33,
          "rebounds": 3,
          "assists": 2,
          "steals": 1,
          "blocks": 1, 
          "slam_dunks": 0
        }
      }
    }
  }
  dict
end

def good_practices 
  game_hash.each do |location, team_data|
    #binding.pry
    team_data.each do |attribute, data|
      #binging.pry
      
    end
  end
end

def num_points_scored(name)
  #binding.pry
  if game_hash[:away][:players][name]
    game_hash[:away][:players][name]["points".to_sym] 
  else
    game_hash[:home][:players][name]["points".to_sym]
  end
end

def shoe_size(name)
  if game_hash[:away][:players][name]
    game_hash[:away][:players][name]["shoe".to_sym] 
  else
    game_hash[:home][:players][name]["shoe".to_sym]
  end
end

def team_colors(team_name)
  if game_hash[:away][:team_name] == team_name
    game_hash[:away][:colors]
  else 
    game_hash[:home][:colors]
  end
end

def team_names
  rarr = []            
  game_hash.each do |team_key, team_value|
    rarr << team_value[:team_name] 
  end 
  rarr 
end

def player_numbers(team)
  rarr = [] 
  if game_hash[:home][:team_name] == team 
    game_hash[:home][:players].each do |name, pattr|
      rarr << pattr["number".to_sym]
    end
  elsif game_hash[:away][:team_name] == team 
    game_hash[:away][:players].each do |name, pattr|
      rarr << pattr["number".to_sym]
    end
  end
  rarr
end

def player_stats(name)
  playersHome = game_hash[:home][:players].keys
  # game_hash[:home][:players].each do |player, stats|
  #   playersHome << player
  # end
  playersAway = game_hash[:away][:players].keys
  # game_hash[:away][:players].each do |player, stats|
  #   playersHome << player
  # end
  if playersHome.include?(name)
    game_hash[:home][:players][name]
  elsif playersAway.include?(name)
    game_hash[:away][:players][name]
  end
end

def big_shoe_rebounds
  maxRebounds = 0
  maxShoe = 0 
  game_hash[:home][:players].each do |nm, stat|
    maxShoe = stat[:shoe]
    break
  end
   
  game_hash[:home][:players].each do |name, stat|
    if maxShoe < stat[:shoe]
      maxShoe = stat[:shoe]
      binding.pry
      maxRebounds = game_hash[:home][:players][name][:rebounds]
    end
  end
  game_hash[:away][:players].each do |name, stat|
    if maxShoe < stat[:shoe]
      maxShoe = stat[:shoe]
      maxRebounds = game_hash[:away][:players][name][:rebounds]
    end
  end
  maxRebounds
end
