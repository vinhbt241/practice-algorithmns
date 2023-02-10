# def breath_first_traversal(graph, key_node)
#   queue = [key_node]

#   while queue.length > 0 
#     current = queue.shift 
#     print current 
#     graph[current].each do |key|
#       queue.push(key)
#     end
#   end
# end

# Use recursion
# def breath_first_traversal(graph, key_node, queue=[])
#   print key_node

#   next_key_nodes = graph[key_node]

#   return if next_key_nodes.nil? && queue.length == 0

#   next_key_nodes.each do |key|
#     queue.push(key)
#   end

#   breath_first_traversal(graph, queue.shift, queue)
# end

# EXAMPLES
example_graph = {
  a: [:c, :b],
  b: [:d],
  c: [:e],
  d: [:f],
  e: [],
  f: []
}

breath_first_traversal(example_graph, :a) 
# => acbedf

