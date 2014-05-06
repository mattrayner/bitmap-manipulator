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
#   - OptionParser would be good for processing of commands - appears overly complex for this implementation

class BitmapManipulator
  # Gobal variables
  @image = nil, @most = 0, @number = 0

  # When a new BitmapManipulator is created
  # begin listening for user input.
  def initialize
    get_input
  end

  # Create a new blank bitmap image.
  #
  # @param [Integer] Most The number of columns.
  # @param [Integer] Number The number of rows.
  def create_image(most, number)
    columns = Array.new

    col_range = 0..(most-1) # Create a range for our columns
    row_range = 0..(number-1) # Create a range for our rows

    # Iterate over each column and create a row.
    col_range.each do
      row = Array.new

      # Iterate over each of the elements in a row.
      row_range.each do
        row << "O" # Save a 'O' colour pixel
      end

      columns << row
    end

    # Save our image
    @image = columns
    # Save the user's dimentions (use for clearing)
    @most = most
    @number = number

    # Ask for more input
    get_input
  end

  # Show the image currently within the manipulator but outputting it
  # in the following format:
  # 0X000
  # 000J0
  # 00AJ0
  # 00HH0
  def show_image
    # Check to see if we have an image
    if @image.nil?
      puts "No image to show. Try running 'I 1 2' and try again."
    else
      # Create a string to hold our output
      output_string = ""
      
      # Get a column & row range
      col_range = 0..(@most-1) # Create a range for our columns
      row_range = 0..(@number-1)

      # Iterate over every row first
      row_range.each do |y|
        # Iterate over each column
        col_range.each do |x|
          output_string += @image[x][y] # Add every pixel to our output string
        end

        # Add a line break
        output_string += "\n"
      end

      puts output_string
    end

    # Ask for more input
    get_input
  end

  # Colour a specified pixel with the colour supplied.
  #
  # @param [Integer] X The X co-ordinate of the pixed to be coloured.
  # @param [Integer] Y The Y co-ordinate of the pixed to be coloured.
  # @param [Char] Colour The colour to be entered.
  def colour_pixel(x, y, colour)
    @image[x][y] = colour

    # Ask for more input
    get_input
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

  # Close the application with or without an error code
  #
  # @param [Integer] Code The error code to close the application with
  def close(code = 0)
    exit code
  end

  private 
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
    # Grab the command
    input = input.split(' ')

    # Ensure we have an input
    if input.length > 0
      case input[0]
      when "X" # Close the application
        close
      when "I" # Create an image
        attempt_image_creation input #Verify our input array and attempt to create an image
      when "C" # Clear the saved image
        attempt_image_clear
      when "S" # Show the image stored
        show_image
      when "L"
        attempt_pixel_colour input # Colour a specific pixel within our image
      end
    end

    print_help
  end

  # Print out instructions with all of the accepted commands a
  # user can enter.
  def print_help
    puts "This is help text"
    get_input
  end

  # Attempt to create an image using the user's provided input.
  #
  # Check the user's input, ensuring that the data
  # required is both present and in the correct format
  #
  # @param [Array] Input The input array that the user has entered i.e. ['I', '102', '303']
  def attempt_image_creation(input)
    # Get the X and Y values or nil
    x = string_to_int input[1]
    y = string_to_int input[2]

    if (!x.nil? && !y.nil?) then create_image(x, y) else error "Cannot create image with sizes '#{input[1]}'x'#{input[2]}'.\n\nPlease try again with numbers." end
  end

  # Attempt to clear the currently stored image (by creating a new one)
  def attempt_image_clear
    if !@image.nil? then create_image(@most, @number) else error "Cannot clear an image that doesn't exist.\n\nTry running 'I 1 2' first and try again." end
  end

  # Attempt to create an image using the user's provided input.
  #
  # Check the user's input, ensuring that the data
  # required is both present and in the correct format
  #
  # @param [Array] Input The input array that the user has entered i.e. ['I', '102', '303']
  def attempt_pixel_colour(input)
    # Do not proceed if there is no image
    if @image.nil?
      error "Cannot colour a pixel if there is no image.\n\nTry running 'I 1 2' first and try again."
    else
      # Get the X and Y values or nil
      x = string_to_int input[1]
      y = string_to_int input[2]

      # Check the colour value is acceptable
      colour = string_to_colour input[3]

      # Check our colour first
      if colour.nil?
        error "Cannot colour pixel with the value entered:\n  - Colours can only be one character long i.e. 'R' not 'Red'.\n  - Colours must be uppercase i.e. 'R' not 'r'.\n\nPlease try again with a valid colour."
      else
        # Make sure that the x & y values are not nil and that they are in-bounds (adjusting for 1 => 0)
        if ((!x.nil? && !y.nil?) && (x-1 <= @most && y-1 <= @number)) then colour_pixel(x-1, y-1, colour) else error "Cannot colour pixel '#{input[1]}'x'#{input[2]}'.\n\nPlease try again with valid co-ordinates." end
      end

    end
  end
  

  # Convert the string passed into an integer to be used as
  # co-ordinated in our bitmap.
  #
  # @param [String] String The string to be converted
  # @return [Integer] Int The converted integer OR NIL
  def string_to_int(string)
    (string.nil?)? nil : string.delete(',').to_i # Allow for 2,364 => 2364 conversion
  end

  # Check the string passed and see if it meets the
  # criteria for a valid colour. If not, return nil
  # 
  # @param [String] String The string to be checked
  # @return [String] Colour The string if it is valid OR NIL
  def string_to_colour(string)
    error = false

    # Make sure there is a string
    if string.nil?
      error = true
    else
      # Check the length
      error = true if string.length != 1
      # Check the case
      error = true if !string.upcase!.nil?
    end

    (error)? nil : string
  end

  # Create an error output and then ask for more input from the user.
  # 
  # @param [String] Error The string to be output
  def error(string)
    puts string
    get_input
  end
end
BitmapManipulator.new