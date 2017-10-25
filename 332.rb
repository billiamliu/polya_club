tickets_0 = [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
tickets_1 = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
tickets_2 = [["A", "C"], ["D", "B"], ["C", "D"], ["JFK", "D"], ["B", "C"], ["JFK", "A"], ["D", "A"], ["C", "JFK"]]

def find_itinerary(tickets)
  tickets = tickets.sort.reverse.group_by(&:first) # put into lexical order
  route = []
  visit = -> airport {
    visit[tickets[airport].pop()[1]] while (tickets[airport] || []).any?
    route << airport
  }
  visit["JFK"]
  route.reverse
end

puts find_itinerary(tickets_0)
puts "\n"
puts find_itinerary(tickets_1)
puts "\n"
puts find_itinerary(tickets_2)
