#!ruby

def print_tab(inp, cols)
    inp = File.readlines(inp).map {|l| l.strip}
    columns = []
    r = inp.size
    cols.times do
        j = (inp.size.to_f / cols).round
        j = r if (r < j)
        columns << j
        r -= j
    end
    columns.map! { |i|
        t = inp[0...i]
        inp = inp[i..-1]
        next t
    }
    columns[0..-2].each {|col|
        sz = col.map{|e| e.size}.max + 4
        col.map!{|e| e.ljust(sz)}
    }
    rows = []
    columns.map{|col| col.size}.max.times { rows << "" }
    columns.each {|col|
        col.each_with_index {|e,i|
            rows[i] += e;
        }
    }
    puts rows.map{|r|r.rstrip}.join("\n")
end

print_tab("keywords.txt", 5)