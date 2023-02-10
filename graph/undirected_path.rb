require 'set'
require_relative 'graph_helper'

def undirected_path?(edges, src, dest)
  graph = build_graph(edges)
  has_path?(graph, src, dest, Set.new)
end

def has_path?(graph, src, dest, visited)
  return true if src == dest 
  return false if visited.include?(src)

  visited << src

  graph[src].each do |key_node|
    return true if has_path?(graph, key_node, dest, visited)
  end

  false
end

# EXAMPLES 
edges = [
  [:i, :j],
  [:k, :i],
  [:m, :k],
  [:k, :l],
  [:o, :n]
]

print undirected_path?(edges, :j, :m) # true 
print undirected_path?(edges, :i, :o) # false