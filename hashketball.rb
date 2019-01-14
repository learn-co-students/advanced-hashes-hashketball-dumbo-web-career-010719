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
# returns the points scored by player_name
  game_hash.each do |t, v1|
    v1[:players].each { |p, v2| return v2[:points] if p == player_name }
  end
end


def shoe_size player_name
# knows the shoe size of player_name
  game_hash.each do |t, v1|
    v1[:players].select { |p, v2| return v2[:shoe] if p == player_name }
  end
end

def team_colors team_name
# knows the team colors of team_name
  game_hash.select { |t, v1| return v1[:colors] if v1[:team_name] == team_name }
end

def team_names
# return team names
  game_hash.collect { |t, v1| v1[:team_name] }
end

def player_numbers team_name
# returns the players' jersey numbers by team_name
  game_hash.each do |t, v1|
    return v1[:players].collect { |p, v2| v2[:number] } if v1[:team_name] == team_name
  end
end


def player_stats player_name
# returns all stats for player_name
  game_hash.each do |t, v1|
    v1[:players].each { |p, v2| return v2 if p == player_name}
  end
end

def big_shoe_rebounds
# returns the number of rebounds of the player with the biggest shoe size
  shoes = {}
  game_hash.each do |t, v1|
    v1[:players].each { |p, v2| shoes[p] = v2[:shoe] }
  end
  playerArr = shoes.max_by {|k,v| v}
  game_hash.each do |t, v1|
    v1[:players].select  { |p, v2| return v2[:rebounds] if p == playerArr.first}
  end
end

def most_points_scored
# returns the player that has the most points
  points = {}
  game_hash.each do |t, v1|
    v1[:players].each { |p, v2| points[p] = v2[:points] }
  end
  playerArr = points.max_by {|k,v| v}
  player = playerArr.first
end

def winning_team
# returns the team that has the most points
  home_points = 0
  away_points = 0
  game_hash[:home][:players].each{|p,v| home_points += v[:points]}
  game_hash[:away][:players].each{|p,v| away_points += v[:points]}
  home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
# returns the player that has the longest name
  home_name = game_hash[:home][:players].max_by{ |k,v| k.length }
  away_name = game_hash[:away][:players].max_by{ |k,v| k.length }
  home_name.first > away_name.first ? home_name.first : away_name.first
end

def long_name_steals_a_ton?
# returns true if the player with the longest name had the most steals
  longName = player_with_longest_name
  longNameSteals = ""
  stealsArr =[]
  game_hash.each { |t, v1| longNameSteals = v1[:players][longName][:steals] if v1[:players].include?(longName)}
  game_hash.each do |t, v1|
    v1[:players].each { |p, v2| stealsArr.push(v2[:steals]) }
  end
  longNameSteals >= stealsArr.max ? true : false
end
