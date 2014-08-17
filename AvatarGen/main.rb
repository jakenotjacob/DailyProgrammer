#!/usr/bin/env ruby

require 'digest'
require 'chunky_png'

#Find all digits in strings
def digest_digits(rows)
  rows.each.map { |row|
    row.chars.map{ |char|  
        true if char.scan(/\d/).empty? == false    
    }  
  }
end


def draw(canvas, png)
  canvas.each { |row|
    row.each { |cell|
      fill_in(cell)
    }
    @y += 5
    @x = 0
  }
end

def fill_in(cell)
  if cell
    #Fill in with colors
    @png.rect(@x, @y, @x+5, @y+5, 
              ChunkyPNG::Color.from_hex(@color),
              ChunkyPNG::Color.from_hex(@color))
  end
  @x += 5
  #increment coords
end

#Split into arrays of 10 bytes
def build_canvas(digest)
  rows = digest.scan(/.{10}/)
  #Create reflection
  rows.concat(rows.reverse)
end


@png = ChunkyPNG::Image.new(50, 50, ChunkyPNG::Color::BLACK)

@x = 0
@y = 0

@color = "%06x" % (rand * 0xffffff)

str = "jakenotjacob"
#Chop off leftover bytes (only need 50)
digest = Digest::SHA2.hexdigest(str)[0...-14]
canvas = digest_digits(build_canvas(digest))
draw(canvas, @png)

@png.save('avatar.png', :interlace => true)
