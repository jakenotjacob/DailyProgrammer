#!/usr/bin/env ruby
#
def hex_to_dec(hex_num)
  hex_num.to_i(16)
end

def dec_to_bin(dec_num)
  dec_num = dec_num.to_s(2)
end

def draw(picture)
  picture.each { |row|
    #row.reverse!   -- Flip the whole bitmap!
    row.each_char { |bin|
      if bin == "0"
        print "\s"
      else
        print "x"
      end
    }
  print "\n"
  }
  print "\n"
end


pictures = ["FF 81 BD A5 A5 BD 81 FF", 
"AA 55 AA 55 AA 55 AA 55",
"3E 7F FC F8 F8 FC 7F 3E",
"93 93 93 F3 F3 93 93 93"]

pictures.map! { |picture_hex|
  pixels = picture_hex.split " "
  pixels.map! { |pixel|
    dec_to_bin(hex_to_dec(pixel))
  }
}

pictures.each { |picture|
  draw(picture)
}
