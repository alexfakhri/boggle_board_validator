class BoggleValidator

  attr_reader :board, :word

  def initialize(board, word)
    @board = board
    @word = word
  end

  def locate_first_letter(letter)
    array = []
    @board.each_index do |i|
      row, j0 = @board[i], 0
      while row.include?(letter)
        if j = (row.index letter)
          array << [i, j0 + j]
          j  += 1
          j0 += j
          row = row.drop j
        end
      end
    end
    return array
  end


  def on_board?(row, col)
    row.between?(0,@board.size) && col.between?(0,@board[0].size)
  end

  def check_letters?(letters, board, row, col)
    return false unless on_board?(row, col)
    return false unless letters.first == board[row][col]
    remaining_letters = letters.drop(1)
    if remaining_letters.empty?
      true
    else
      board[row][col] = '-'
      check_in_all_directions?(remaining_letters, board, row, col)
    end
  end

  def check_in_all_directions?(letters, board, row, col)
    check_letters?(letters, board, row, col - 1) ||  #left
    check_letters?(letters, board, row - 1, col - 1) ||  #up left
    check_letters?(letters, board, row - 1, col) ||  #up
    check_letters?(letters, board, row - 1, col + 1) ||  #up right
    check_letters?(letters, board, row, col + 1) ||  #right
    check_letters?(letters, board, row + 1, col + 1) ||  #down right
    check_letters?(letters, board, row + 1, col) ||  #down
    check_letters?(letters, board, row + 1, col - 1) #down left
  end

  def valid_guess?
    letters = @word.chars
    first_letter = locate_first_letter(letters.first)
    return false if first_letter.empty?
    first_letter.each do |row|
      board = Marshal::load(Marshal.dump(@board))
      return true if check_letters?(letters, board, row[0], row[1])
    end
    false
  end

end
