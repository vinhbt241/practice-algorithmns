# Graph
# def has_path?(graph, src, dest)
#   return true if src == dest 

#   graph[src].each do |key_node|
#     return true if has_path?(graph, key_node, dest)
#   end

#   return false
# end

# Queue
def has_path?(graph, src, dest)
  queue = [src]

  while queue.length > 0
    current = queue.shift 
    return true if current == dest 

    graph[current].each do |key_node|
      queue.push(key_node)
    end
  end

  return false
end

# EXAMPLES
example_graph = {
  a: [:c, :b],
  b: [:d],
  c: [:e],
  d: [:f],
  e: [],
  f: []
}

print has_path?(example_graph, :a, :e) # true
print has_path?(example_graph, :b, :e) # false