require "pry"
# Write your code here!


def game_hash
  game = {
    :home => {
      :team_name => "",
      :colors => [],
      :players => {}
    },
    :away => {
      :team_name => "",
      :colors => [],
      :players => {}
    }
  }
  home_name = ["Alan Anderson",	"Reggie Evans",	"Brook Lopez",	"Mason Plumlee",	"Jason Terry"]
  home_info = [ 
    ['0', '16', '22', '12', '12', '3', '1', '1'], 
    ['30', '14', '12', '12', '12', '12', '12', '7'], 
    ['11', '17', '17', '19', '10', '3', '1', '15'], 
    ['1', '19', '26', '12', '6', '3', '8', '5'], 
    ['31', '15', '19', '2', '2', '4', '11', '1'] 
  ]
  game[:home][:team_name] = "Brooklyn Nets"
  game[:home][:colors] = ["Black", "White"]
  home_name.zip(home_info).each do |name, info|
    game[:home][:players].merge!({
      name => {
        :number => info[0].to_i,
        :shoe =>info[1].to_i,
        :points => info[2].to_i,
        :rebounds => info[3].to_i,
        :assists => info[4].to_i,
        :steals => info[5].to_i,
        :blocks => info[6].to_i,
        :slam_dunks => info[7].to_i
      }
    })    
    end
    
    away_name = ["Jeff Adrien", "Bismak Biyombo", "DeSagna Diop", "Ben Gordon", "Brendan Haywood"]
    away_info = [
      ['4', '18', '10', '1', '1', '2', '7', '2'],
      ['0', '16', '12', '4', '7', '7', '15', '10'],
      ['2', '14', '24', '12', '12', '4', '5', '5'],
      ['8', '15', '33', '3', '2', '1', '1', '0'],
      ['33', '15', '6', '12', '12', '22', '5', '12']
    ]
    game[:away][:team_name] = "Charlotte Hornets"
    game[:away][:colors] = ["Turquoise", "Purple"]
    away_name.zip(away_info).each do |name, info|
    game[:away][:players].merge!({
      name => {
        :number => info[0].to_i,
        :shoe =>info[1].to_i,
        :points => info[2].to_i,
        :rebounds => info[3].to_i,
        :assists => info[4].to_i,
        :steals => info[5].to_i,
        :blocks => info[6].to_i,
        :slam_dunks => info[7].to_i
      }
    })    
    end
    game
end

def num_points_scored(player)
  hash = game_hash
  
  hash.each do |h_a, v|
    if v[:players].key?(player)
      return v[:players][player][:points]
    end
  end
end

def shoe_size(player)
  hash = game_hash
  
  hash.each do |h_a, v|
    if v[:players].key?(player)
      return v[:players][player][:shoe]
    end
  end
end

def team_colors(team)
  hash = game_hash
  
  hash.each do |h_a, v|
    if v[:team_name] == team
      return v[:colors]
    end
  end
end

def team_names
  hash = game_hash
  
  hash.collect do |h_a, v|
    v[:team_name]
  end
end

def player_numbers(team)
  hash = game_hash
  output = []
  
  hash.each do |h_a, v|
    if v[:team_name] == team
      v[:players].each do |player, value|
        output.push(value[:number])
      end
    end
  end
  output
end

def player_stats(name)
  hash = game_hash
  
  hash.each do |key, value|
    if value[:players].key?(name)
      return value[:players][name]
    end
  end
end

def big_shoe_rebounds
  hash = game_hash
  big_shoe = 0
  person = nil
  
  hash.each do |key, value|
    value[:players].each do |k, v|
      if v[:shoe] > big_shoe
        big_shoe = v[:shoe]
        person = k
      end
    end
  end
  
  hash.each do |key, value|
    if value[:players].key?(person)
      return value[:players][person][:rebounds]
    end
  end
end



