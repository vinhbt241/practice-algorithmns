# Use recursion
# def depth_first_travelsal(graph, key_node, stack=[])
#   print key_node

#   next_key_nodes = graph[key_node]

#   return if next_key_nodes.nil? && stack.length == 0

#   next_key_nodes.each do |key|
#     stack.push(key)
#   end

#   depth_first_travelsal(graph, stack.pop, stack)
# end

# Also recursion, but clever
# def depth_first_travelsal(graph, key_node)
#   print key_node 

#   graph[key_node].each do |key|
#     depth_first_travelsal(graph, key)
#   end
# end

# Use while loop
# def depth_first_travelsal(graph, key_node)
#   stack = [key_node]

#   while stack.length > 0 
#     current = stack.pop 
#     print current 
#     graph[current].each do |val|
#       stack.push(val)
#     end
#   end
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

depth_first_travelsal(example_graph, :a)
# => abdfce or acebdf