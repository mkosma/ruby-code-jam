# simple substitution cypher
#
# 'a' -> 'y', 'o' -> 'e', and 'z' -> 'q'. This means that "a zoo" will become "y qee".

# input:
#    The first line of the input gives the number of test cases, T. T test cases follow, one per line.
#    Each line consists of a string G in Googlerese, made up of one or more words containing the letters 'a' - 'z'.
#    There will be exactly one space (' ') character between consecutive words and no spaces at the beginning or at the end of any line.

# Output:
#    For each test case, output one line containing "Case #X: S" where X is the case number and S is the string
#    that becomes G in Googlerese.

rosetta_g = <<HERE
ejp mysljylc kd kxveddknmc re jsicpdrysi
rbcpc ypc rtcsra dkh wyfrepkym veddknkmkrkcd
de kr kd eoya kw aej tysr re ujdr lkgc jv
HERE

rosetta_e = <<HERE
our language is impossible to understand
there are twenty six factorial possibilities
so it is okay if you want to just give up
HERE

Cipher = Hash[rosetta_g.chars.to_a.zip rosetta_e.chars.to_a]
Cipher['q'] = 'z'
Cipher['z'] = ("abcdefghijklmnopqrstuvwxyz".chars.to_a - Cipher.values).first

throw "failure" if Cipher.count != 28

def translate(s)
  s.chars.to_a.map {|c| Cipher[c]}.to_s
end

#puts Cipher.keys.sort.join("")
#puts translate(rosetta_g)

File.open(ARGV[0], 'r') do |f|
  n_cases = f.readline
  case_number = 1
  f.each do |line|
    puts "Case ##{case_number}: #{translate(line)}"
    case_number += 1
  end
end
