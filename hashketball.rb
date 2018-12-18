# Write your code here!

def game_hash
  teams = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {number:0,shoe:16,points:22,rebounds:12,assists:12,steals:3,blocks:1,slam_dunks:1   },
        "Reggie Evans" => {number:30,shoe:14,points:12,rebounds:12,assists:12,steals:12,blocks:12,slam_dunks:7   },
        "Brook Lopez" => {number:11,shoe:17,points:17,rebounds:19,assists:10,steals:3,blocks:1,slam_dunks:15   },
        "Mason Plumlee" => {number:1,shoe:19,points:26,rebounds:12,assists:6,steals:3,blocks:8,slam_dunks:5   },
        "Jason Terry" => {number:31,shoe:15,points:19,rebounds:2,assists:2,steals:4,blocks:11,slam_dunks:1   }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {number:4,shoe:18,points:10,rebounds:1,assists:1,steals:2,blocks:7,slam_dunks:2   },
        "Bismak Biyombo" => {number:0,shoe:16,points:12,rebounds:4,assists:7,steals:7,blocks:15,slam_dunks:10   },
        "DeSagna Diop" => {number:2,shoe:14,points:24,rebounds:12,assists:12,steals:4,blocks:5,slam_dunks:5   },
        "Ben Gordon" => {number:8,shoe:15,points:33,rebounds:3,assists:2,steals:1,blocks:1,slam_dunks:0   },
        "Brendan Haywood" => {number:33,shoe:15,points:6,rebounds:12,assists:12,steals:22,blocks:5,slam_dunks:12   }
      }
    }
  }

end

def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players && game_hash[location][attribute].has_key?(player) == true
          return game_hash[location][attribute][player][:points]
      end#if
    end#team_data
  end#game_hash
end#def

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players && game_hash[location][attribute].has_key?(player) == true
          return game_hash[location][attribute][player][:shoe]
      end#if
    end#team_data
  end#game_hash
end#def

def team_colors(name)
  game_hash.each do |location, team_data|
    if game_hash[location].has_value?(name) == true
      team_data.each do |attribute, data|
        if attribute == :team_name
          return game_hash[location][:colors]
        end
      end
    end
  end
end

def team_names
  j = []
  game_hash.each do |location, team_data|
    j << game_hash[location][:team_name]
  end
  j
end

def player_numbers(name)
  j, k = [], []
  game_hash.each do |location, team_data|
    if game_hash[location].has_value?(name) == true
      team_data.each do |attribute, data|
        if attribute == :players
          j = game_hash[location][attribute].keys
          j.each do |name|
            k << game_hash[location][attribute][name][:number]
          end#j
        end#if
      end#team_data
    end#if
  end#game_hash
  k
end#def

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players && game_hash[location][attribute].has_key?(name) == true
        return game_hash[location][attribute][name]
      end#if
    end#team_data
  end#game_hash
end#def

  #grab shoe sizes
def grab_shoe
  j, k = [], 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute = :players
        j = game_hash[location][attribute].keys
        j.each do |name|
          if game_hash[location][attribute][name][:shoe] > k
            k = game_hash[location][attribute][name][:shoe]
          end#if
        end#j
      end#if
    end#team
  end#game
  k
end

#check and match
def check_and_match
  j = []
  k = grab_shoe
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        j = game_hash[location][attribute].keys
        j.each do |name|
          if game_hash[location][attribute][name][:shoe] == k
            return game_hash[location][attribute][name][:rebounds]
          end#if
        end#j
      end#if
    end#team
  end#game
end#def

def big_shoe_rebounds
  check_and_match
end

=begin

def big_shoe_rebounds
  i,j, k = 0, [], []

  #grab shoe sizes
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute = :players
        j = game_hash[location][attribute].keys
        j.each do |name|
          k << game_hash[location][attribute][name][:shoe]
        end#j
      end#if
    end#team
  end#game

#compare
  l = k[0]
  while i < k.size
    if l < k[i]
      l = k[i]
      i += 1
    end#if
  end#while

#check and match
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == players
        j.each do |name|
          if game_hash[location][attribute][name][:shoe] == l
            return game_hash[location][attribute][name][:rebounds]
          end#if
        end#j
      end#if
    end#team
  end#game

end#def




game_hash.each do |location, team_data|
  team_data.each do |attribute, data|
  end
end

teams = {
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" => {number:0,shoe:16,points:22,rebounds:12,assists:12,steals:3,blocks:1,slam_dunks:1   },
      "Reggie Evans" => {number:30,shoe:14,points:12,rebounds:12,assists:12,steals:12,blocks:12,slam_dunks:7   },
      "Brook Lopez" => {number:11,shoe:17,points:17,rebounds:19,assists:10,steals:3,blocks:1,slam_dunks:15   },
      "Mason Plumlee" => {number:1,shoe:19,points:26,rebounds:12,assists:6,steals:3,blocks:8,slam_dunks:5   },
      "Jason Terry" => {number:31,shoe:15,points:19,rebounds:2,assists:2,steals:4,blocks:11,slam_dunks:1   }
    }

  }
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Torquise", "Purple"],
    players: {
      "Jeff Adrien" => {number:4,shoe:18,points:10,rebounds:1,assists:1,steals:2,blocks:7,slam_dunks:2   },
      "Bismak Biyombo" => {number:0,shoe:16,points:12,rebounds:4,assists:7,steals:7,blocks:15,slam_dunks:10   },
      "DeSagna Diop" => {number:2,shoe:14,points:24,rebounds:12,assists:12,steals:4,blocks:5,slam_dunks:5   },
      "Ben Gordon" => {number:8,shoe:15,points:33,rebounds:3,assists:2,steals:1,blocks:1,slam_dunks:0   },
      "Brendan Haywood" => {number:33,shoe:15,points:6,rebounds:12,assists:12,steals:22,blocks:5,slam_dunks:12   }
    }

  }
}
=end
