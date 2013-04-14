# Source: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example/

# Ruby 1.9:
class Range
  # From active_support/core_ext/range/include_range.rb
  # Extends the default Range#include? to support range comparisons.
  def include_with_range?(value)
    if value.is_a?(::Range)
      # 1...10 includes 1..9 but it does not include 1..10.
      operator = exclude_end? && !value.exclude_end? ? :< : :<=
      include_without_range?(value.first) && value.last.send(operator, last)
    else
      include_without_range?(value)
    end
  end

  # alias_method_chain :include?, :range
end

p Range.ancestors # => [Range, Enumerable, Object...]

# Ruby 2.0
module IncludeRangeExt
  # Extends the default Range#include? to support range comparisons.
  def include?(value)
    if value.is_a?(::Range)
      # 1...10 includes 1..9 but it does not include 1..10.
      operator = exclude_end? && !value.exclude_end? ? :< : :<=
      super(value.first) && value.last.send(operator, last)
    else
      super
    end
  end
end

class Range
  prepend IncludeRangeExt
end

p Range.ancestors # => [IncludeRangeExt, Range, Enumerable, Object...]
