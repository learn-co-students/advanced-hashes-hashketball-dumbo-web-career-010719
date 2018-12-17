require 'pry'

def game_hash
  game_hash=
  {:home => 
  	{
    :team_name => 'Brooklyn Nets',
    :colors => ['black', 'white'],
    :players => 
    {
    	'Alan Anderson' => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
         'Reggie Evans'=> { number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
         'Brook Lopez'=> { number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        'Mason Plumlee'=>{number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
       'Jason Terry' =>{ number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
    }
   },
  :away => 
  {
    :team_name => 'Charlotte Hornets',
    :colors => ['turquoise', 'purple'],
    :players => 
      {
      'Jeff Adrien'=>{number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      'Bismak Biyombo'=>{ number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
      'DeSagna Diop'=>{number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      'Ben Gordon'=>{number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      'Brendan Haywood' =>{number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
 game_hash
end

 def good_practices

 	num_of_rebounds=-1
 	max=-1
  	game_hash.each do |home_away, keys|		 
      		 keys[:players].each do |k,v|   		  	  
      		 	 if v[:shoe]>max 	
      		 	 	 max=v[:shoe]
      		 	 	 num_of_rebounds=v[:rebounds] 
      		 	 end
      		 end
  	end
    num_of_rebounds
 end

puts good_practices 

def num_points_scored (player_name_arg)
	numpoints=-1
	   game_hash.each do |location, team_data|
       
          team_data.each do |attribute, data|
                   	if attribute==:players 
                       data.each do |player_name, player_data|
                       	   	     
                       	   	     player_data.each do |k,v|
                       	   	     	   if k==:points && player_name_arg==player_name
                       	   	     	   	      numpoints=v
                       	   	     	   end
                       	   	     end	
                       end
                   	end
                   
          end
       end
     
  numpoints
end


def  shoe_size (player_name_arg)

	shoe_size=-1
	   game_hash.each do |location, team_data|
       
          team_data.each do |attribute, data|
                   	if attribute==:players 
                       data.each do |player_name, player_data|
                       	   	     
                       	   	     player_data.each do |k,v|
                       	   	     	   if k==:shoe && player_name_arg==player_name
                       	   	     	   	      shoe_size=v
                       	   	     	   end
                       	   	     end	
                       end
                   	end
                   
          end
       end
     
  shoe_size
end


def team_colors (team_name)

	game_hash.each do |home_away, keys|
    		if keys[:team_name] == team_name
      		 return keys[:colors].map(&:capitalize)
    		end
  	end
end

def team_names
  game_hash.map {|location, keys| 
  	keys[:team_name]
  }
end

def player_numbers (team_name)
	player_jursey_num =[]
  	game_hash.each do |home_away, keys|
    	if keys[:team_name] == team_name
      		 
      		 keys[:players].map do |k,v|
      		 	 player_jursey_num.push(v[:number])
      		 end
      		 
    	end
  	end
	player_jursey_num
 end

 def player_stats (player_name)
	player_state_hash= {}
  	game_hash.each do |home_away, keys|		 
      		 keys[:players].each do |k,v|
      		  	 if k== player_name
                    player_state_hash=v;
      		  	 end
      		 end
  	end
    player_state_hash
    
 end

 def big_shoe_rebounds
 	num_of_rebounds=-1
 	max=-1
  	game_hash.each do |home_away, keys|		 
      		 keys[:players].each do |k,v|   		  	  
      		 	 if v[:shoe]>max 	
      		 	 	 max=v[:shoe]
      		 	 	 num_of_rebounds=v[:rebounds] 
      		 	 end
      		 end
  	end
    num_of_rebounds
 end