require 'set'

def island_count(matrix)
  visited = Set.new
  count = 0

  (0..matrix.length).each do |row_index|
    (0..matrix[0].length).each do |col_index|
      count += 1 if explore(matrix, row_index, col_index, visited)
    end
  end

  count
end

def explore(matrix, row_index, col_index, visited)
  return false if row_index < 0 || row_index >= matrix.length
  return false if col_index < 0 || col_index >= matrix[0].length

  ceil = matrix[row_index][col_index]
  return false if visited.include?([row_index, col_index]) || ceil == "W"

  visited << [row_index, col_index]

  explore(matrix, row_index + 1, col_index, visited)
  explore(matrix, row_index - 1, col_index, visited)
  explore(matrix, row_index, col_index + 1, visited)
  explore(matrix, row_index, col_index - 1, visited)

  return true
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

puts island_count(islands_one) # -> 4
puts island_count(islands_two) # -> 3
