class TicTacToe
  attr_accessor :cells, :cell_placement

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @player1 = Player.new('player1_name', 'X')
    @player2 = Player.new('player2_name', 'O')
    @cell_placement = ''
  end

  def start_game
    puts "Let's Play Tic Tac Toe!"
    get_players
    display_board(@cells)

    moves_counter = 9
    while moves_counter > 0
      turn(moves_counter, @player1, @player2)
      moves_counter -= 1
      check_win(@player1, @player2)
    end

    end_game
  end

  def get_players
    puts 'Enter name for Player 1:'
    player1_name = gets.chomp
    @player1.name = player1_name

    puts 'Enter name for Player 2:'
    player2_name = gets.chomp
    @player2.name = player2_name
  end

  def turn(moves_counter, player1, player2)
    if moves_counter.odd?
      puts "Player 1's turn."
      player_turn(player1)
    else
      puts "Player 2's turn"
      player_turn(player2)
    end
    display_board(@cells)
  end

  def player_turn(player)
    puts "#{player.name}, place #{player.mark}:"
    @cell_placement = gets.chomp.to_i - 1
    until check_valid_move?(@cell_placement)
      puts "#{player.name}, place #{player.mark}:"
      @cell_placement = gets.chomp.to_i - 1
    end
    player.store_move(@cell_placement)
    show_move(@cell_placement, player.mark)
  end

  def check_valid_move?(cell_placement)
    @cells[cell_placement].to_i > 0 && cell_placement >= 0 && cell_placement < 9
  end

  def show_move(cell_placement, mark)
    @cells[cell_placement] = mark
  end

  def winning_move?(moves)
    winning_cells = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 4], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    winning_cells.any? { |set| set - moves == [] }
  end

  def check_win(player1, player2)
    if winning_move?(player1.moves)
      @winner = 'Player 1'
      end_game
    elsif winning_move?(player2.moves)
      @winner = 'Player 2'
      end_game
    end
  end

  def end_game
    if @winner == 'Player 1' || @winner == 'Player 2'
      puts "Game over! #{@winner} wins."
    else
      puts "Game over! It's a draw."
    end

    restart
  end

  def restart
    puts 'Play again? [Y/N]'
    restart = gets.chomp.upcase

    until restart == 'Y' || restart == 'N'
      puts 'Play again? [Y/N]'
      restart = gets.chomp.upcase
    end

    if restart == 'Y'
      TicTacToe.new.start_game
    else
      exit
    end
  end

  def display_board(cells)
    puts "+-----------------------+
    \r|       |       |       |
    \r|   #{cells[0]}   |   #{cells[1]}   |   #{cells[2]}   |
    \r|       |       |       |
    \r+-------+-------+-------+
    \r|       |       |       |
    \r|   #{cells[3]}   |   #{cells[4]}   |   #{cells[5]}   |
    \r|       |       |       |
    \r+-------+-------+-------+
    \r|       |       |       |
    \r|   #{cells[6]}   |   #{cells[7]}   |   #{cells[8]}   |
    \r|       |       |       |
    \r+-----------------------+"
  end
end

class Player
  attr_accessor :name, :mark, :moves

  def initialize(name, mark)
    @name = name
    @mark = mark
    @moves = []
  end

  def store_move(cell_placement)
    @moves = @moves.push(cell_placement).sort
  end
end


