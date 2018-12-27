# Write your code here!
require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
    ]
    }
  }
end

def num_points_scored(name)
  game_hash.each do |location, where|
    where.each do |team, info|
    # puts "This is my team: #{team}"
    # puts "This is my info #{info}"
      if team == :players
        info.each do |key|
        # puts "This is my key: #{key}"
        # puts "This is my value #{value}"
          key.each do |key1, value1|
          # puts key1
          # puts value1
          if value1 == "#{name}"
          return key[:points]
          end
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, where|
    where.each do |team, info|
    # puts "This is my team: #{team}"
    # puts "This is my info #{info}"
      if team == :players
        info.each do |key|
        # puts "This is my key: #{key}"
        # puts "This is my value #{value}"
          key.each do |key1, value1|
          # puts key1
          # puts value1
          if value1 == "#{name}"
          return key[:shoe]
          end
          end
        end
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |location, where|
    where.each do |team, info|
      if info == "#{name}"
        return where[:colors]
      end
    end
  end
end


def team_names
ans = []
  game_hash.each do |location, where|  
    ans.push(where[:team_name])
  end
ans
end


def player_numbers(name)
  game_hash.each do |location, where|
    where.each do |team, info|
    # puts "This is my team: #{team}"
    # puts "This is my info #{info}"
      if team == :players
        info.each do |key|
        # puts "This is my key: #{key}"
        # puts "This is my value #{value}"
          key.each do |key1, value1|
          # puts key1
          # puts value1
          if value1 == "#{name}"
          return key[:number]
          end
          end
        end
      end
    end
  end
end

def player_numbers(name)
ans = []
  game_hash.each do |location, where|  
    if where[:team_name] == "#{name}"
    	where[:players].each do |key|
   	 ans.push(key[:number])
    	end
    end
  end
return ans
end


def player_stats(name)
ans = {}
  game_hash.each do |location, where|  
  # puts where[:players]
    where[:players].each do |key, value|
        if key[:player_name] == name
        ans = key
        ans.delete(:player_name)
        return ans

      end
    end
  end
end



def big_shoe_rebounds
  shoe = 0
  rebound = 0

  game_hash.each do |location, where|  
  # puts where[:players]
    where[:players].each do |key|
      key.each do |key1, value1|
      # puts "#{key1} == #{value1}"
        if ("#{key1}" == "shoe")
          puts value1
            if value1 > shoe
              shoe = value1
              puts "this is rebound #{key[:rebounds]}"
              rebound = key[:rebounds]
            end
          puts "this is shoe::: #{shoe}" 
        end
       if ("#{key1}" == "shoe") && value1 == shoe
          puts "Hey its value1:::: #{value1}"
          if "#{key1}" == shoe
          return where[:rebounds]
          end
        end
      end
    end
  end
  return rebound
end