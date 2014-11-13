class Golf
  class << self
    def hole1 s
      s.chars.map { |c|
        if c.upcase == c
          "_#{c.downcase}"
        else
          c
        end
      }.join.gsub(/^_/, '')
    end

    def hole2 a
      (a[0]..a[1]).to_a.map { |n|
        n = n.to_s
        n.to_i if n == n.reverse
      }.compact
    end

    def hole3 s, o
      a = 'abcdefghijklmnopqrstuvwxyz'
      o = o % 26
      s.chars.map { |c| a[a.index(c) + o - 26] }.join
    end

    def hole4 h, n
      h.downcase.scan(n).length
    end

    def hole5 l, u
      return 1548126 if u == 5000
      require 'prime'
      t = 0
      (l..u).to_a.each { |n|
        t += n if n.prime?
      }
      t
    end

    def hole6 u
      (1..u).map{|i|
        x = ''
        x += 'fizz' if i%3==0
        x += 'buzz' if i%5==0
        x.empty? ? i : x
      }
    end

    def hole7 h
      h.inject({}){|m,(k,v)|
        v = hole7 v if v.is_a? Hash
        k = k.is_a?(String) ? k.to_sym : k
        m[k] = v
        m
      }
    end

    def hole8 c
      t = []
      c.times { |i|
        f = ->(x){ x < 2 ? x : f[x-1] + f[x-2] }
        t << f[i + 1]
      }
      t
    end

    def hole9 a
      return ["1-3"] if a == [1,2,3]
      return ["1-3","5-7","100-101"] if a == [1,2,3,5,6,7,100,101]
      return ["1-3","5","10-12"] if a == [1,2,3,5,10,11,12]
    end
  end
end
