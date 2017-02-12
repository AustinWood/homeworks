def first_anagram?(str1, str2)
  possible_anagrams = anagrams(str1)
  possible_anagrams.include?(str2)
end

def anagrams(str)
  arr = []
  return [str] if str.length <= 1
  previous_anagrams = anagrams(str[0...-1])
  previous_anagrams.each do |anagram|
    (0..anagram.length).each do |i|
      dup = anagram.dup
      arr << dup.insert(i, str[-1])
    end
  end
  arr
end

# puts first_anagram?("elvis", "lives")

def second_anagram?(str1, str2)

  outer_loop = true
  while outer_loop
    outer_loop = false
    i = 0
    inner_loop = true
    while i < str1.length && inner_loop
      c1 = str1[i]
      str2.chars.each.with_index do |c2, j|
        if c1 == c2
          str1 = str1[0...i] + str1[(i+1)..-1]
          str2 = str2[0...j] + str2[(j+1)..-1]
          outer_loop = true
          inner_loop = false
          break
        end

      end
      i += 1
      #outer_loop = true
    end
  end
  puts "#{str1} #{str2}"
  str1.chars.empty? && str2.chars.empty?
end

puts second_anagram?("elvis", "livves")

def third_anagram?(str1, str2)
  arr1 = str1.chars.sort
  arr2 = str2.chars.sort
  arr1 == arr2
end

def fourth_anagram?(str1, str2)
  hash = Hash.new(0)
  str1.chars.each { |el| hash[el] += 1 }
  str2.chars.each { |el| hash[el] -= 1 }
  hash.all? { |_, v| v.zero? }
end

#puts fourth_anagram?("elvis", "lives")
