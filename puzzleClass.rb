require 'net/http'

class CreatePuzzle
  attr_accessor :width, :height, :puz

  def initialize(width, height)
    @width = width
    @height = height
    @spaceRow = 0
    @spaceCol = 0
    @puz = []
    counter = 1
    @height.times do
      temp_row = []
      col_counter = 0
      while col_counter < @width
        temp_row << counter
        counter += 1
        col_counter += 1
      end
      temp_row
      @puz << temp_row
    end
    @puz[height-1][width-1] = ' '

    def spaceRow
      return @spaceRow
    end

    def spaceCol
      return @spaceCol
    end
  end


  def setPuzzle(s)
    @puz = []
    num = 0
    count = 0
    a = s.split(",")
    height.times do
      temp_row = []
      col_counter = 0
      while col_counter < @width
        temp_row << a[num]
        num +=1
        col_counter += 1
      end
      @puz << temp_row
    end
    @puz[height-1][width-1] = ' '
  end


  def getPuzzle
    @puz.each do |row|
      row
      row.each do |cel|
        print cel
      end
      puts
    end
  end

  def moveUp
    space = false
    @width.times do |row|
      @height.times do |col|
        if space
          break
        end
        if row > 0
          if @puz[row][col] == " "
            @puz[row][col], @puz[row-1][col] = @puz[row-1][col], @puz[row][col]
            space = true
          end
        end
      end
    end

  end

  def moveDown
    space = false
    width.times do |row|
      height.times do |col|
        if space
          break
        end
        if row < height-1
          if @puz[row][col] == " "
            # puts "Space found @ Y: #{row} and X: #{col}"
            @puz[row][col], @puz[row+1][col] = @puz[row+1][col], @puz[row][col]
            space = true
          end
        end
      end
    end
  end

  def moveLeft
    space = false
    @width.times do |row|
      @height.times do |col|
        if space
          break
        end
        if col > 0
          if @puz[row][col] == " "
            @puz[row][col], @puz[row][col-1] = @puz[row][col-1], @puz[row][col]
            space = true
          end
        end
      end
    end
  end

  def moveRight
    space = false
    width.times do |row|
      height.times do |col|
        if space
          break
        end
        if col < width-1
          if @puz[row][col] == " "
            @puz[row][col], @puz[row][col+1] = @puz[row][col+1], @puz[row][col]
            space = true
          end
        end
      end
    end
  end

  def solve
    space = false
    width.times do |row|
      height.times do |col|
        if space
          break
        end
        if col < width-1
          if @puz[row][col] == " "
            @puz[row][col], @puz[height-1][width-1] = @puz[height-1][width-1], @puz[row][col]
            space = true
          end
        end
      end
    end
  end

  def to_s
    return "Your Puzzle is: #{width} squares wide! "+"\n"+"#{height} squares High!
The Puzzle consist of #{width * height} spaces!
The puzzle contains the values #{ @puz.join("  ")}and a Space"

  end

  def scramble
    @puz.shuffle!
    @puz.each do |row|
      row.shuffle!
    end
  end

  def run_Puzzle
    print "Would you like to run the puzzle? 1. Yes 2. No: "
    user_play = gets.to_i
    print "What size do you want the Width of the puzzle to be? "
    user_width = gets.to_i
    print "What size do you want the Height of the puzzle to be? "
    user_height = gets.to_i
    puz = CreatePuzzle.new(user_width, user_height)
    puz.getPuzzle
    while user_play == 1
      list = ["1. Move Up ", " 2. Move Down ", " 3. Move Left ", " 4. Move Right ", "5. Get The Puzzle! ",
              " 6. Set Up A Puzzle ", "7. Scramble the Puzzle", " 8. Solve the Puzzle ", "9. Print Puzzle info to_s! ", " 10. Quit! "]
      puts "Please Choose One!"
      print list [0]
      print list [1]
      print list [2]
      puts list [3]
      print list [4]
      puts list [5]
      print list [6]
      puts list [7]
      print list [8]
      puts list [9]
      users_choice = gets.to_i
      if users_choice == 1
        puts "Move Up!!!"
        puz.moveUp
        puz.getPuzzle
      end
      if users_choice == 2
        puts "Move Down!!!"
        puz.moveDown
        puz.getPuzzle
      end
      if users_choice == 3
        puts "Move Left!!!"
        puz.moveLeft
        puz.getPuzzle
      end
      if users_choice == 4
        puts "Move Right!!!"
        puz.moveRight
        puz.getPuzzle
      end
      if users_choice == 5
        puts "Get Puzzle!!!"
        puz.getPuzzle
      end
      if users_choice == 6
        size = (@width * @height)-1
        puts "Set Puzzle!!!"

        puts "enter #{size} comma separated numbers or letters!"
        numbers = gets.to_s
        puz.setPuzzle(numbers)
        puz.getPuzzle
      end
      if users_choice == 7
        puts "Scramble!!!"
        puz.scramble
        puz.getPuzzle
      end
      if users_choice == 8
        puts "Solve!!!"
        puz.solve
        puz.getPuzzle
      end
      if users_choice == 9
        puts "To_S!!!"
        puts puz.to_s
      end
      if users_choice == 10
        user_play = 2
      end
    end
    if user_play == 2
      print "Well That must mean that you are done!"
    end
  end
end
