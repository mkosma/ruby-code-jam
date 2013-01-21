# benchmarking ruby search for sample Google Codejam problem #1
#

require 'benchmark'
require 'set'

credit = rand(1000-4) + 5
n_items = 10000000

prices = Array.new(n_items - 1) { rand(1000) + 1 }
prices << credit - prices[0]
prices.shuffle

Benchmark.bm(10) do |x|
  x.report('brute force') do
    val =  prices.each do |p0|
      break p0 if prices.include?(credit - p0)
    end
    puts val
  end

  x.report('hash') do
    prices_hash = Hash[prices.zip prices]
    val = prices.each do |p0|
      break p0 if prices_hash.has_key?(credit - p0)
    end
    puts val
  end

  x.report('set') do
    prices_set = prices.to_set
    val = prices.each do |p0|
      break p0 if prices_set.include?(credit - p0)
    end
    puts val
  end

end
