p1 = [[9, 5], [5, 2], [5, 3], [2, 0], [3, 1]]
p2 = [[425, 400], [400, 399], [399, 310], [310, 300], [300, 150], [150, 100], [100, 50], [50, 0]]

def find(num_courses, prerequisites)
  prerequisites = prerequisites.map do |c|
    [c[1], c[0]]
  end
  prerequisites = prerequisites.group_by(&:first)

  i = 0
  route = []
  sel = -> c {
    sel[prerequisites[c].pop()[1]] while (prerequisites[c] || []).any?
    route << c
    i += 1
  }
  sel[0]

  i == num_courses
end

puts find(6, p1)
puts find(9, p2)
