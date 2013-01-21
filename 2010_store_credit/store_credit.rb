# sample Google Codejam problem #1
#

#require 'benchmark'
#require 'set'

# simple seems best

# file format:
#    1: n_cases
#    2: c1 credit value
#    3: c1 n_items
#    4: c1 item prices (space-separated)
#    5: c2 credit value
#    6: c2 n_items
#    etc.

# output:  "Case #x: a b" where a and b are the indexes of the found items

File.open(ARGV[0], 'r') do |f|
  n_cases = f.readline
  case_number = 1
  begin
    while(credit = f.readline.to_i)
    n_items = f.readline.to_i
    item_prices = f.readline.chomp.split(' ').map(&:to_i)
    # puts [credit, item_prices].inspect
    result = n_items.times do |i|
      j = item_prices.index(credit - item_prices[i])
      next if j == i
      break [i,j] if j
    end
    result.sort!
    puts "Case ##{case_number}: #{result[0]+1} #{result[1]+1}"
#    puts "Case ##{case_number}: #{credit}:  #{item_prices[result[0]]} +  #{item_prices[result[1]]} = #{item_prices[result[0]] + item_prices[result[1]]}"

    case_number += 1
    end
  rescue EOFError
  end
end
