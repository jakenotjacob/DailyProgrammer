#!/usr/bin/env ruby
#

puts "Enter matrix size separated by a space: "
x, y = gets.chomp.split(" ")
nodes, edges = x.to_i, y.to_i
@matrix = Array.new(nodes){ Array.new(edges, 0) }


def set_edges(str, matrix)
  nodes = str.split(" ")
  from_node, to_nodes = nodes[0], nodes[2..-1]
  from_node = from_node.to_i
  to_nodes.map!{ |n| n.to_i }
  to_nodes.each{ |node|
    matrix[from_node][node] = 1
  }
end


def print_matrix(matrix)
  matrix.each{ |row|
    row.each { |col|
      print col
    }
    print "\n"
  }
end

str = "0 -> 1
1 -> 2
2 -> 4
3 -> 4
0 -> 3"

strs = str.split("\n")
strs.each{ |str|
  set_edges(str, @matrix)
}

print_matrix(@matrix)
