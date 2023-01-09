# Write your code below game_hash
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
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
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
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# returns number of points scored by a given player
def num_points_scored name
  get_player_by_name(name).each do |key, value|
    return value if key==:points
  end
end

# returns the shoe size of a given player
def shoe_size name
  get_player_by_name(name).each do |key, value|
    return value if key==:shoe
  end
end

# returns the colors of a given team
def team_colors team_name
  game_hash.each do |team, data|
    if data[:team_name] == team_name
      team_we_want = data
      return team_we_want[:colors]
    end
  end
end

# returns the names of the teams
def team_names
  names_array = []
  game_hash.each do |team, data|
    names_array << data[:team_name]
  end
  names_array
end

def player_numbers team_name
  jersey_numbers_array = []
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      team_data.find do |key, value|
        if key == :players
          value.each do |player, player_data|
            player.each do |key, value|
              jersey_numbers_array << value if key == :number
            end
          end
        end
      end
    end
  end
  pp jersey_numbers_array
end

# get a players full stats by name
def player_stats name
  game_hash.each do |team, data|
    data.each do |key, value|
      if key == :players
        value.each do |player|
          return player if player[:player_name] == name
        end
      end
    end
  end
end

# get the number of rebounds from the player with the biggest shoe size
def big_shoe_rebounds
  all_players = get_all_players
  biggest_shoe = all_players[0]
  all_players.each do |player|
    biggest_shoe = player if shoe_size(get_player_name(player)) > shoe_size(get_player_name(biggest_shoe))   
  end
  get_rebounds biggest_shoe
end

# ----------------------------------------------------------helper functions-------------------------------------------------------------------- #

def get_player_by_name name
  get_all_players.each do |player|
    player.each do |key, value|
      return player if key==:player_name && value==name
    end
  end
end

def get_all_players
  players = []
  game_hash.each do |location, team_data|
    team_data.each do |key, value|
      if key == :players
        value.each do |player, player_data|
          players << player
        end   
      end     
    end
  end
  players
end

def get_player_name player
  player.each do |key, value|
    return value if key==:player_name
  end
end

def get_rebounds player
  player.each do |key, value|
    return value if key==:rebounds
  end
end

