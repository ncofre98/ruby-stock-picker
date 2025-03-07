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

require 'pry-byebug'

def nil_edge_cases!(prices)
  prices[0] = nil if prices[0] == prices.max
  prices[prices.length - 1] = nil if prices[prices.length - 1] == prices.compact.min
end

def stock_picker(prices)
  nil_edge_cases!(prices)
  most_expensive_day_index = prices.index(prices.map(&:to_i).max)
  prices_per_day = prices.each_with_index.map {|price, day| {:day => day, :price => price} }
  prices_per_day.sort_by { |hash| hash[:price].to_i }
=begin
  prices_per_day.each do |hash|
    if (hash[:price] != nil)
      if (hash[
    end
  end
=end
end  

########################

puts stock_picker([17,3,6,9,15,8,6,1,10])


# Step 1: nil first value if is the biggest
# Step 2: nil the last value if is the smaller
# Step 3: nil the values that are bigger than the smaller
# Step 4: create a sorted array [nil, 1, 2...] or [1, 2, ... nil]
# Step 5: try the biggest difference (last - first) if first is before last, otherwise try with next number (next - last)
# Step 6: if so, return the indexes
