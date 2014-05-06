# BitmapManipulator

A very basic Ruby bitmap manipulator.

## Usage
Launch the application:
```ruby
ruby manipulator.rb
```

Enter an array of commands to manipulate a bitmap:
````
Basic Ruby Bitmap Manipulator
-----------------------------
Commands:
  I [width] [height]         # Create an image that is [width] wide and [height] high. NOTE [height] cannot exceed 250.
  C                          # Clear the image contents.
  L [x] [y] [colour]         # Colour the pixel at [x] [y] the colour [colour].
  V [x] [y1] [y2] [colour]   # Draw a vertical line starting at co-ordinates [x], [y1] and ending at [x], [y2] (inclusive).
  H [x1] [x2] [y] [colour]   # Draw a horizontal line starting at co-ordinates [x1], [y] and ending at [x2], [y] (inclusive).
  F [x] [y] [colour]         # Fill all pixels that are the same colour as image[x, y] and touching with the colour [colour].
  R [direction "H" || "V"]   # Reflect (flip) the image either vertically or horizontally.
  S                          # Show the image as it currently is.
  X                          # Exit - close out of the application.  
````

Example usage:
````
$ ruby manipulator.rb 
> I 10 10
> L 3 3 A
> V 1 4 8 R
> H 5 9 7 G
> S
OOOOOOOOOO
OOOOOOOOOO
OOAOOOOOOO
ROOOOOOOOO
ROOOOOOOOO
ROOOOOOOOO
ROOOGGGGGO
ROOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
> V 5 1 6 A      
> H 5 10 6 A
> F 10 1 B
> S
OOOOABBBBB
OOOOABBBBB
OOAOABBBBB
ROOOABBBBB
ROOOABBBBB
ROOOAAAAAA
ROOOGGGGGO
ROOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
> R H
> S
BBBBBAOOOO
BBBBBAOOOO
BBBBBAOAOO
BBBBBAOOOR
BBBBBAOOOR
AAAAAAOOOR
OGGGGGOOOR
OOOOOOOOOR
OOOOOOOOOO
OOOOOOOOOO
> R V 
> S
OOOOOOOOOO
OOOOOOOOOO
OOOOOOOOOR
OGGGGGOOOR
AAAAAAOOOR
BBBBBAOOOR
BBBBBAOOOR
BBBBBAOAOO
BBBBBAOOOO
BBBBBAOOOO
> C
> S
OOOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
> X
$ 
````