require "minitest/autorun"
require_relative "puzzleClass.rb"

class TestCreatePuzzle <MiniTest::Test
  #Test_Setup
  def setup
  @test_puz = CreatePuzzle.new(3, 3)
   end
    #Test Class_Exist
   def test_class_exist
     assert_kind_of(CreatePuzzle, @test_puz, "Puzzle class Not Created``!")
   end

  def test_Init
    #Test Width and Height
    # assert_equal(3, @test_puz.width)
    # assert_equal(3, @test_puz.height)
    #Tests initialize method!
   assert_equal([[1, 2, 3], [4, 5, 6], [7, 8, " "]], @test_puz.getPuzzle)

 end

 def test_set_puz
    #Test setPuzzle
 @test_puz.setPuzzle("*,1,2,3,*,5,6,7,*")
   assert_equal([["*","1","2"], ["3","*","5"], ["6","7"," "]], @test_puz.getPuzzle)
 end

 def test_move_up_down_left_right
    #Test moveUp
    @test_puz.moveUp
    assert_equal([[1, 2, 3], [4, 5, " "], [7, 8, 6]], @test_puz.getPuzzle)
    @test_puz.moveUp
    assert_equal([[1, 2, " "], [4, 5, 3], [7, 8, 6]], @test_puz.getPuzzle)
    @test_puz.moveUp
    assert_equal([[1, 2, " "], [4, 5, 3], [7, 8, 6]], @test_puz.getPuzzle)

    #Test moveDown
    @test_puz.moveDown
    assert_equal([[1, 2, 3], [4, 5, " "], [7, 8, 6]], @test_puz.getPuzzle)
    @test_puz.moveDown
    assert_equal([[1, 2, 3], [4, 5, 6], [7, 8, " "]], @test_puz.getPuzzle)

    #Test moveLeft
    @test_puz.moveLeft
    assert_equal([[1, 2, 3], [4, 5, 6], [7, " ", 8]], @test_puz.getPuzzle)
    @test_puz.moveLeft
    assert_equal([[1, 2, 3], [4, 5, 6], [" ", 7, 8]], @test_puz.getPuzzle)
    @test_puz.moveLeft
    assert_equal([[1, 2, 3], [4, 5, 6], [" ", 7, 8]], @test_puz.getPuzzle)

    #Test moveRight
    @test_puz.moveRight
    assert_equal([[1, 2, 3], [4, 5, 6], [7, " ", 8]], @test_puz.getPuzzle)
    @test_puz.moveRight
    assert_equal([[1, 2, 3], [4, 5, 6], [7, 8, " "]], @test_puz.getPuzzle)
    @test_puz.moveRight
    assert_equal([[1, 2, 3], [4, 5, 6], [7, 8, " "]], @test_puz.getPuzzle)

 end
 def test_other_methods
    #test solve Return the original puzzle from the init method!
    @test_puz.solve
    assert_equal([[1, 2, 3], [4, 5, 6], [7, 8, " "]], @test_puz.getPuzzle)

    #Test to_s return a string representation of the puzzle!
    @test_puz.to_s
    assert_equal( "Your Puzzle is: 3 squares wide! "+"\n"+"3 squares High!"+"\n"+"The Puzzle consist of 9 spaces!
The puzzle contains the values 1  2  3  4  5  6  7  8   and a Space", @test_puz.to_s)

    #Test the scramble method that will shuffle the rows and then the cells in that row
    @test_puz.scramble
    refute_equal("[[1, 2, 3], [4, 5, 6], [7, 8, " "]]", @test_puz.getPuzzle)

 end


end

