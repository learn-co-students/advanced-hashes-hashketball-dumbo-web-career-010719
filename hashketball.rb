require "pry"

def game_hash
game_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black","White"],
    :players => {
      :player_one => {
        :name => "Alan Anderson",
        :stats => {
          :shoe => 16,
          :number => 0,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }
      },
      :player_two => {
        :name => "Reggie Evans",
        :stats => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }
      },
      :player_three => {
        :name => "Brook Lopez",
        :stats => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }
      },
      :player_four => {
        :name => "Mason Plumlee",
        :stats => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }
      },
      :player_five => {
        :name => "Jason Terry",
        :stats => {
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
    }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Purple","Turquoise"],
    :players => {
      :player_one => {
        :name => "Jeff Adrien",
        :stats => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }
      },
      :player_two => {
        :name => "Bismak Biyombo",
        :stats => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        }
      },
      :player_three => {
        :name => "DeSagna Diop",
        :stats => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }
      },
      :player_four => {
        :name => "Ben Gordon",
        :stats => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }
      },
      :player_five => {
        :name => "Brendan Haywood",
        :stats => {
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
}
end

# num_points_scored
# knows the number of points scored by each player
# what hash will u find the players points?
# How can u return the number of points for a particular player?
def num_points_scored(player_name)
  game_hash.each do |team, data|
      data[:players].each do |player, player_stats|
        if player_stats[:name] == player_name
          return player_stats[:stats][:points].to_i
        end
      end
  end
end
# shoe_size
# knows the shoe size of each player
def shoe_size(player_name)
  game_hash.each do |team, data|
      data[:players].each do |player, player_stats|
        if player_stats[:name] == player_name
          return player_stats[:stats][:shoe].to_i
        end
      end
  end
end

# team_colors
# knows the Brooklyn Nets colors are Black and White
def team_colors(team_name)
  game_hash.each do |team, data|
    if data[:team_name] == team_name
      return data[:colors]
    end
  end
end
# team_names
# returns the team names
def team_names
  team_arr = []
  team_arr << game_hash[:home][:team_name]
  team_arr << game_hash[:away][:team_name]
  return team_arr
end
# player_numbers
# returns the player jersey numbers
def player_numbers(team_name)
  players_nums = []
  game_hash.each do |team,data|
    if data[:team_name] == team_name
      data[:players].each do |player,player_stats|
        players_nums << player_stats[:stats][:number]
      end
    end
  end
  return players_nums
end

# player_stats
# returns all stats for a given player
def player_stats(player_name)
  game_hash.each do |team, data|
    data[:players].each do |player,player_stats|
      if player_stats[:name] == player_name
        return player_stats[:stats]
      end
    end
  end
end
# big_shoe_rebounds
# returns the number of rebounds of the player with the biggest shoe size
# first find the player with the largest shoe size
# return that player's number of rebounds
def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |team,data|
    data[:players].each do |player, player_stats|
      if player_stats[:stats][:shoe] > biggest_shoe
        biggest_shoe = player_stats[:stats][:shoe]
        rebounds = player_stats[:stats][:rebounds]
      end
    end
  end
  return rebounds
end
