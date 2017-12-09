require'json';o=[];JSON.parse(ARGV[1]).each{|r|o+=JSON.parse(ARGV[0]).select{|i|i>=r[0]&&i<=r[1]}};p o
