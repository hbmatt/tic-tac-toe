$cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]

class TicTacToe
  def self.start_game
    puts "Let's Play Tic Tac Toe!"

    puts 'Enter name for Player 1:'
    player1_name = gets.chomp
    player1 = Player.new(player1_name, 'X')

    puts 'Enter name for Player 2:'
    player2_name = gets.chomp
    player2 = Player.new(player2_name, 'O')

    TicTacToe.display_board

    moves_counter = 9

    while moves_counter > 0
      if moves_counter.odd?
        puts "Player 1's turn."
        player1.place_move
      else
        puts "Player 2's turn"
        player2.place_move
      end

      TicTacToe.display_board

      if player1.winning_move?(player1.moves) == true
        @winner = 'Player 1'
        TicTacToe.end_game
      elsif player2.winning_move?(player2.moves) == true
        @winner = 'Player 2'
        TicTacToe.end_game
      else
        moves_counter -= 1
      end
    end

    TicTacToe.end_game
  end

  def self.end_game
    if @winner == 'Player 1' || @winner == 'Player 2'
      puts "Game over! #{@winner} wins."
    else
      puts "Game over! It's a draw."
    end

    puts 'Play again? [Y/N]'
    restart = gets.chomp.upcase

    until restart == 'Y' || restart == 'N'
      puts 'Play again? [Y/N]'
      restart = gets.chomp
    end

    if restart =='Y'
      $cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      TicTacToe.start_game
    else
      exit
    end
  end

  def self.display_board
    puts "+-----------------------+
    \r|       |       |       |
    \r|   #{$cells[0]}   |   #{$cells[1]}   |   #{$cells[2]}   |
    \r|       |       |       |
    \r+-------+-------+-------+
    \r|       |       |       |
    \r|   #{$cells[3]}   |   #{$cells[4]}   |   #{$cells[5]}   |
    \r|       |       |       |
    \r+-------+-------+-------+
    \r|       |       |       |
    \r|   #{$cells[6]}   |   #{$cells[7]}   |   #{$cells[8]}   |
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

  def place_move
    puts "#{@name}, place #{@mark}:"
    cell_placement = gets.chomp.to_i

    until $cells[cell_placement - 1].to_i > 0
      puts "Cell #{cell_placement} is taken. #{name}, place #{@mark}:"
      cell_placement = gets.chomp
    end

    @moves = @moves.push(cell_placement).sort
    $cells[cell_placement - 1] = @mark
  end

  def winning_move?(moves)
    winning_cells = [[1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7]]
    winning_cells.include?(moves)
  end
end


TicTacToe.start_game
