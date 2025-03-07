=begin
Assignment:

Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

  > stock_picker([17,3,6,9,15,8,6,1,10])
  => [1,4]  # for a profit of $15 - $3 == $12

Quick Tips:

    You need to buy before you can sell
    Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

=end

def nil_edge_cases!(prices)
  prices[0] = nil if prices[0] == prices.max
  prices[-1] = nil if prices[-1] == prices.compact.min
end

def stock_picker(prices)
  nil_edge_cases!(prices)
  most_expensive_day_index = prices.index(prices.map(&:to_i).max)
  prices_per_day = prices.each_with_index.map {|price, day| {:day => day, :price => price} }
  prices_per_day.sort_by! { |hash| hash[:price].to_i }

  prices_per_day.each do |hash|
    if (hash[:price] != nil)
      if (hash[:day] < most_expensive_day_index)
        return [hash[:day], most_expensive_day_index]
      end
    end
  end
  []  
end

########################
# TEST PURPOSES ONLY #

def test_stock_picker
  test_cases = [
    { input: [17, 3, 6, 9, 15, 8, 6, 1, 10], expected: [1, 4], description: "Base case" },
    { input: [10, 9, 8, 7, 6, 5, 4, 3, 2, 1], expected: [], description: "Prices only decrease (no possible profit)" },
    { input: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], expected: [0, 9], description: "Prices only increase (buy at the beginning, sell at the end)" },
    { input: [10, 8, 6, 4, 2, 3, 5, 7, 9], expected: [4, 8], description: "Drops and then rises (wait for the lowest and sell later)" },
    { input: [5, 3, 10, 1, 6, 4, 8, 12, 2, 9], expected: [3, 7], description: "Fluctuations (find the best combination)" },
    { input: [7], expected: [], description: "Single day (cannot buy and sell)" },
    { input: [5, 10], expected: [0, 1], description: "Two days with profit" },
    { input: [10, 5], expected: [], description: "Two days without possible profit" }
  ]

  test_cases.each do |test|
    result = stock_picker(test[:input])  # Make sure you have implemented the stock_picker function
    status = result == test[:expected] ? "✅ PASSED" : "❌ FAILED"
    puts "#{status} - #{test[:description]}"
    puts "  Input: #{test[:input]}"
    puts "  Expected: #{test[:expected]}, Got: #{result}"
    puts "-" * 50
  end
end

test_stock_picker
