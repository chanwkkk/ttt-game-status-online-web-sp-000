# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
WIN_COMBINATIONS.detect do |combo| # it is ok to use .each too. But #detect save much work since it only returns the first element that makes the block true
#for each combo in WIN_COMBINATIONS do
  position_1=board[combo[0]]
  position_2=board[combo[1]]
  position_3=board[combo[2]]
if position_1==position_2&& position_2==position_3 && position_taken?(board,combo[0])# make sure position is not " "
  return combo
end
end
false
end

def full?(board)
  board.none?{|space| space==" "}
end

def draw? (board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  if won?(board)
    winner=won?(board)[0]
    board[winner]
  end
end
