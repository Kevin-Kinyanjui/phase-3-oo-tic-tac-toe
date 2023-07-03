
class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i
  end

  def move(index, player_token = "X")
    @board[index - 1] = player_token
  end

  def position_taken?(index)
    @board[index - 1] != " "
  end

  def valid_move?(index)
    index.between?(1, 9) && !position_taken?(index)
  end

  def turn_count
    count = 0
    @board.each do |cell|
      count += 1 if cell != " "
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter a number between 1 and 9:"
    input = gets.chomp
    index = input_to_index(input)

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Invalid move. Try again."
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      a, b, c = combo
      @board[a] == @board[b] && @board[b] == @board[c] && @board[a] != " "
    end
  end

  def full?
    @board.all? { |cell| cell != " " }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      WIN_COMBINATIONS.each do |combo|
        a, b, c = combo
        if @board[a] == @board[b] && @board[b] == @board[c] && @board[a] != " "
          return @board[a]
        end
      end
    end
  end
end
