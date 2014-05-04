# A very basic 'bitmap' manipulator working with a co-ordinate
# matrix and colour values
#
# @author Matthew Rayner
# @data 04/04/14
# @version 0.5

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


# Present the user with an input and process what is submitted.
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

get_input