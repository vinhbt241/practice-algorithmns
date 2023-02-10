require 'set'
def largest_component(graph)
  visited = Set.new 
  largest = 0

  graph.keys.each do |current_node|
    components_counted = count_node(graph, current_node, visited)
    largest = [components_counted, largest].max
  end

  largest
end

def count_node(graph, node, visited)
  return 0 if visited.include?(node)

  visited << node 

  counted = 1

  graph[node].each do |value|
    counted += count_node(graph, value.to_sym, visited)
  end

  counted
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

puts largest_component(graph) # -> 4