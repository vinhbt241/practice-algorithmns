require 'set'
require_relative 'graph_helper'

# With this algorithm, it is recommended to use BFT instead of DFT, because it reduce the change to travel wrong direction

def shortest_path(edges, src_node, dest_node)
  graph = build_graph(edges)

  visited = Set.new

  queue = [[src_node, 0]]

  while queue.length > 0 
    current_node, current_distance = queue.shift 
    return current_distance if current_node == dest_node

    next if visited.include?(current_node)

    visited << current_node 

    graph[current_node].each do |key_node|
      queue.push([key_node, current_distance + 1])
    end
  end

  nil
end

# EXAMPLES

# EXAMPLES 
edges = [
  [:w, :x],
  [:x, :y],
  [:z, :y],
  [:z, :v],
  [:w, :v]
]

puts shortest_path(edges, :w, :z) # -> 2