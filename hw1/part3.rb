def combine_anagrams(words)
 # YOUR CODE HERE
 results = {}
 words.each do |word| 
 	(results[word.downcase.chars.sort.join] ||= []) << word end
 return results.values
end
