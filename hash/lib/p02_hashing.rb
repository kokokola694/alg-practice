class Array
  def hash
    result = 0
    each_with_index { |el, i| result += el.hash ^ i.hash }
    result
  end
end

class String
  def hash
    result = 0
    each_byte.with_index { |byte, i| result += byte.hash ^ i.hash }
    result
  end
end

class Hash
  def hash
    result = 0
    each {|k,v| result += k.hash ^ v.hash}
    result
  end
end
