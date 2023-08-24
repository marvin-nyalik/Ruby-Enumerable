module MyEnumerable
  def all?
    @list.each do |element|
      result = yield element if block_given?
      return false if result == false
    end
    true
  end

  def filter
    filtered = []
    @list.each do |element|
      result = yield element if block_given?
      filtered << element if result == true
    end
    filtered
  end
end
