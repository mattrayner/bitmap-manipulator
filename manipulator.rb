# A very basic 'bitmap' manipulator working with a co-ordinate
# matrix and colour values
#
# @author Matthew Rayner
# @data 04/04/14
# @version 0.5

# Design Decision:
#   - Decision to keep the project as vanilla ruby at this stage.

# Process:
#   - Take input from user
#   - Work out what they want to do
#   - Perform action
#     - Create matrix
#     - Colour 'pixel'
#     - Draw H/V line
#     - Fill a reigon (recursion on all new points?)
#     - Show current matrix
#     - Exit out of the session (with error code 0)

# Thoughts:
#   - OptionParser would be good for process of commands BUT
#     not designed for this form of work? Primarily for
#     application arguments.

# Gobal variables
@image = nil
@most = 0
@number = 0

# Present the user with a prompt and pass what is entered off
# for processing.
def get_input
  print "> "
  input = STDIN.gets

  process_input input
end

# Process the user's input, classifying the command entered or
# returning a help message if a suitable command is not found.
#
# @param [String] command The command entered by the user
def process_input(input)
  #What commands can we take?
  print_help
end

# Print out instructions with all of the accepted commands a
# user can enter.
def print_help
  puts "This is help text"
end

# Colour a specified pixel with the colour supplied.
#
# @param [Integer] X The X co-ordinate of the pixed to be coloured.
# @param [Integer] Y The Y co-ordinate of the pixed to be coloured.
# @param [Char] Colour The colour to be entered.
def colour_pixel(x, y, colour)
  @image[x][y] = colour
end

# Create a new blank bitmap image.
#
# @param [Integer] Most The number of columns.
# @param [Integer] Number The number of rows.
def create_image(most, number)
  columns = Array.new

  # Iterate over each column and create a row.
  0..(most-1).each do
    row = Array.new

    # Iterate over each of the elements in a row.
    0..(number-1).each do
      row << 0
    end

    columns << row
  end

  @image = columns
end

# Draw a vertical line within our bitmap.
#
# @param [Integer] X The X position within our bitmap.
# @param [Integer] Y1 The Y starting position within the bitmap.
# @param [Integer] Y2 The Y end position eithin the bitmap.
# @param [Char] Colour The colour of our line.
def create_vertical_line(x, y1, y2, colour)
  range = y1..y2

  range.each do |n|
    colour_pixel x n colour
  end
end

# Draw a horizontal line within our bitmap.
#
# @param [Integer] X1 The X starting position within our bitmap.
# @param [Integer] X2 The X end position within the bitmap.
# @param [Integer] Y The Y position within the bitmap.
# @param [Char] Colour The colour of our line.
def create_horizontal_line(x1, x2, y, colour)
  range = x1..x2

  range.each do |n|
    colour_pixel n y colour
  end
end

get_input