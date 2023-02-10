require 'set'

def connected_components_count(graph)
  count = 0
  visited = Set.new

  graph.keys.each do |current_node|
    count += 1 if explore(graph, current_node, visited)
  end

  count
end

def explore(graph, node, visited)
  return false if visited.include?(node)
  
  visited << node

  graph[node].each do |value|
    explore(graph, value.to_sym, visited)
  end

  return true
end

# EXAMPLES
graph = {
  '0': %w[8 1 5],
  '1': %w[0],
  '5': %w[0 8],
  '8': %w[0 5],
  '2': %w[3 4],
  '3': %w[2 4],
  '4': %w[3 2]
}

print connected_components_count(graph) # => 2