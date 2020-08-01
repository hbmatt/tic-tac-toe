require './tic-tac-toe.rb'

describe TicTacToe do
  describe "#check_valid_move?" do
    it "returns false when players try to place moves on occupied cells" do
      game = TicTacToe.new
      game.cells = ['X','X','O',4,5,6,7,8,9]
      expect(game.check_valid_move?(0)).to eq(false)
    end

    it "returns false when players enter a number greater than 9" do
      game = TicTacToe.new
      game.cells = [1,2,3,4,5,6,7,8,9]
      expect(game.check_valid_move?(10)).to eq(false)
    end

    it "returns true when players enter an unoccupied cell number" do
      game = TicTacToe.new
      game.cells = ['X','O',3,4,'X',6,7,8,9]
      expect(game.check_valid_move?(3)).to eq(true)
    end
  end

  describe "#show_move" do
    it "pushes the player's mark in place of the cell they chose" do
      game = TicTacToe.new
      expect(game.show_move(5,'X')).to eq(game.cells[5])
    end
  end

  describe "#winning_move?" do
    it "returns true when won on a horizontal" do
      game = TicTacToe.new
      moves = [0,1,2]
      expect(game.winning_move?(moves)).to eq(true)
    end

    it "returns true when won on a vertical" do
      game = TicTacToe.new
      moves = [1,4,7]
      expect(game.winning_move?(moves)).to eq(true)
    end

    it "returns true when won on a diagonal" do
      game = TicTacToe.new
      moves = [2,4,6]
      expect(game.winning_move?(moves)).to eq(true)
    end

    it "returns true when won even when more than three moves were made" do
      game = TicTacToe.new
      moves = [2,4,6,7]
      expect(game.winning_move?(moves)).to eq(true)
    end

    it "returns false when game isn't won" do
      game = TicTacToe.new
      moves = [2,3,7]
      expect(game.winning_move?(moves)).to eq(false)
    end
  end
end

describe Player do
  describe "#store_move" do
    it "stores player's moves in their moves array" do
      player1 = Player.new("Player 1","X")
      expect(player1.store_move(5)).to eq([5])
    end
  end
end