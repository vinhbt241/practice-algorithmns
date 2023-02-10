def build_graph(edges)
  graph = Hash.new { |hash, key| hash[key] = [] }

  edges.each do |edge|
    graph[edge[0]] = graph[edge[0]].push(edge[1])
    graph[edge[1]] = graph[edge[1]].push(edge[0])
  end

  graph
end  