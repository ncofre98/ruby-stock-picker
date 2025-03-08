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

def stock_picker(prices)
  best_days = []
  profit = 0

  for a in 0..prices.length - 1 do
    for b in a+1..prices.length - 1 do
      if (prices[a] < prices[b] && (prices[b] - prices[a]) > profit)
        profit = prices[b] - prices[a]
        best_days = [a, b]
      end
    end
  end

  best_days
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
    { input: [10, 5], expected: [], description: "Two days without possible profit" },
    { input: [7, 5, 5, 18, 4, 8, 6, 17], expected: [1, 3], description: "Prueba Rosita 1" },
    { input: [7, 15, 17, 5, 5, 6, 17], expected: [3, 6], description: "Prueba Rosita 2" },
    { input: [7, 15, 17, 5, 5, 6, 16], expected: [3, 6], description: "Prueba Rosita 3" },
    { input: [20, 21, 7, 5, 8, 6, 18, 4, 8, 17], expected: [3, 6], description: "Prueba Rosita 4" },
    { input: [20, 21, 7, 5, 5, 18, 4, 8, 5, 17], expected: [3, 5], description: "Prueba Rosita malvada" },
    { input: [823, 625, 700, 512, 478, 900, 330, 195, 213, 422, 180, 299, 550, 690, 120, 155, 399, 415, 680, 150, 135, 199, 270, 305, 475, 510, 690, 720, 875, 980, 105, 130, 220, 310, 455, 620, 710, 920, 1010, 1120, 80, 95, 210, 275, 390, 450, 500, 620, 800, 950, 1000, 1025, 1100, 1150, 1195, 1250, 990, 880, 775, 690, 520, 410, 355, 290, 205, 140, 95, 80, 50, 60, 85, 125, 160, 245, 300, 375, 490, 600, 750, 910, 980, 1050, 1080, 1125, 1170, 1205, 1270, 1325, 1380, 1440, 1495, 1550, 1585, 1620, 1655, 1700, 1750, 1790, 1830, 1875], expected: [68,99], description: "Large scale test"}
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