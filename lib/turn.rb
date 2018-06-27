

def valid_move?(board,index)
  return_value = false
  if index.between?(0,8)
    return_value = true
  end
  return return_value && !position_taken?(board, index) # position_taken? returns false if the square is available, so need to negate that
end

def position_taken?(board, index)
  return_value = false
  if board[index] == "X" || board[index] == "O"
    return_value = true
  elsif board[index] == " " || board[index] == "" || board[index] == nil
    return_value = false
  else
    return_value = false
  end
  return return_value
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, x_or_o = "X")
  board[position] = x_or_o
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  user_input = input_to_index(user_input)
  if valid_move?(board, user_input) == true
    move(board, user_input, "X")
    display_board(board)
  else
    turn(board)
  end
end
