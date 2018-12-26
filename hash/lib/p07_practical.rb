require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  hash = HashMap.new
  string.each_char do |ch|
    if hash[ch]
      hash.delete(ch)
    else
      hash[ch] = true
    end
  end
  
  return true if hash.count <= 1
  false
end
