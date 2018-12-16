# Write your code here!
require 'pry'
def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end
def num_points_scored(name)
  point = nil
  game_hash.each {|teamLoc, teamObj|
    teamObj[:players].each {|pName, statsObj|
      if (pName == name)
        point = statsObj[:points]
      end
    }
  }
  point
end
def shoe_size(name)
  shoe = nil
  game_hash.each {|teamLoc, teamObj|
    teamObj[:players].each {|pName, statsObj|
      if (pName == name)
        shoe = statsObj[:shoe]
      end
    }
  }
  shoe
end
def team_colors(team)
  colors = ""
  game_hash.each {|teamLoc, teamObj|
    if (teamObj[:team_name] == team)
      colors = teamObj[:colors]
    end
  }
  colors
end
def team_names
  teams = [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end
def player_numbers(teamName)
  numbs = []
  game_hash.each {|teamLoc, teamObj|
    if (teamObj[:team_name] == teamName)
      teamObj[:players].each {|pName, statsObj|
          numbs.push(statsObj[:number])
      }
    end
  }
  numbs
end
def player_stats(name)
  stat = nil
  game_hash.each {|teamLoc, teamObj|
    teamObj[:players].each {|pName, statsObj|
      if (pName == name)
        stat = statsObj
      end
    }
  }
  stat
end
def big_shoe_rebounds
  bigShoe = 0
  rebs = ""
  game_hash.each {|teamLoc, teamObj|
    teamObj[:players].each {|pName, statsObj|
      if (statsObj[:shoe] > bigShoe)
        bigShoe = statsObj[:shoe]
        rebs = statsObj[:rebounds]
      end
    }
  }
  rebs
end
def most_points_scored
  npts = 0
  name = ""
  game_hash.each {|teamLoc, teamObj|
    teamObj[:players].each {|pName, statsObj|
      if (statsObj[:points] > npts)
        npts = statsObj[:points]
        name = pName
      end
    }
  }
  name
end
def winning_team
  teams = {
  }
  game_hash.each {|teamLoc, teamObj|
    teams[teamLoc] = {"team" => teamObj[:team_name], "pts" => 0}
    teamObj[:players].each {|pName, statsObj|
      teams[teamLoc]["pts"] += statsObj[:points]
    }
  }
  if (teams[:home]["pts"] > teams[:away]["pts"])
    return teams[:home]["team"]
  else
    return teams[:away]["team"]
  end
end
def player_with_longest_name
  nLength = 0
  name = ""
  game_hash.each {|teamLoc, teamObj|
    teamObj[:players].each {|pName, statsObj|
      if (pName.length > nLength)
        nLength = pName.length
        name = pName
      end
    }
  }
  name
end
def long_name_steals_a_ton?
  nSteals = 0
  name = ""
  game_hash.each {|teamLoc, teamObj|
    teamObj[:players].each {|pName, statsObj|
      if (statsObj[:steals] > nSteals)
        nSteals = statsObj[:steals]
        name = pName
      end
    }
  }
  return name == player_with_longest_name
end
