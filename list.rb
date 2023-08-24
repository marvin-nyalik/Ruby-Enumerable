require_relative 'enumerable'

class MyList
  include MyEnumerable

  attr_accessor :list

  def initialize(*args)
    @list = args
  end

  def each
    @list.size.times do |num|
      yield @list[num] if block_given?
    end
  end
end

list = MyList.new(1, 2, 3, 4)
list.each { |e| puts e }
puts(list.all? { |e| e < 5 })
puts(list.all? { |e| e > 5 })
puts(list.any? { |e| e == 2 })
puts(list.any? { |e| e == 5 })
puts list.filter { |e| e.even? }.inspect # rubocop:disable Style/SymbolProc
