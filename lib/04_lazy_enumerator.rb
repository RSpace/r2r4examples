# Source: http://shugomaeda.blogspot.dk/2012/03/enumerablelazy-and-its-benefits.html

# A right triangle whose sides form a Pythagorean triple is called a Pythagorean triangle.
# A Pythagorean triple consists of three positive integers a, b, and c, such that a² + b² = c²

def pythagorean_triples
  (1..Float::INFINITY).lazy.flat_map {|z|
    (1..z).flat_map {|x|
      (x..z).select {|y|
        x**2 + y**2 == z**2
      }.map {|y|
        [x, y, z]
      }
    }
  }
end

p pythagorean_triples.first(10)
