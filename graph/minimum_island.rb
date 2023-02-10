require 'set'

def minimum_island(island)
  visited = Set.new

  minimum = Float::INFINITY 

  (0..island.length).each do |row_index|
    (0..island[0].length).each do |col_index|
      island_size = explore_size(island, row_index, col_index, visited) 
      if island_size > 0
        minimum = [minimum, island_size].min
      end
    end
  end

  minimum
end

def explore_size(island, row_index, col_index, visited)
  return 0 if row_index < 0 || row_index >= island.length 
  return 0 if col_index < 0 || col_index >= island[0].length 

  ceil = island[row_index][col_index]
  return 0 if visited.include?([row_index, col_index]) || ceil == "W"

  visited << [row_index, col_index]

  island_size = 1

  island_size += explore_size(island, row_index + 1, col_index, visited)
  island_size += explore_size(island, row_index - 1, col_index, visited)
  island_size += explore_size(island, row_index, col_index + 1, visited)
  island_size += explore_size(island, row_index, col_index - 1, visited)

  island_size
end

# EXAMPLES
islands_one = [
  %w[W L W W L W],
  %w[L L W W L W],
  %w[W L W W W W],
  %w[W W W L L W],
  %w[W L W L L W],
  %w[W W W W W W]
]

islands_two = [
  %w[W L W W W],
  %w[W L W W W],
  %w[W W W L W],
  %w[W W L L W],
  %w[L W W L L],
  %w[L L W W W]
]

puts minimum_island(islands_one) # -> 1
puts minimum_island(islands_two) # -> 2