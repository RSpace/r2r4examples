# Source: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example/

# Extends the default Range#include? to support range comparisons.
module IncludeRangeExt
  refine Range do
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
end

def test_before(r)
  r.include?(2..3)
end
p (1..4).include?(2..3) # => false (default behavior)

# Now turn on the refinement:
using IncludeRangeExt

p (1..4).include?(2..3) # => true  (refined behavior)

def test_after(r)
  r.include?(2..3)
end
p test_after(1..4) # => true (defined after using, so refined behavior)

p 3.times.all? do
  (1..4).include?(2..3)
end # => true  (refined behavior)

# But refined version happens only for calls defined after the using:
p test_before(1..4) # => false (defined before, not affected)

# Note:
p (1..4).send :include?, 2..3 # => false (for now, send ignores refinements)
