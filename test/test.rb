require 'tempfile'
require_relative '../lib/mmap_ffi'

t = Tempfile.new("mmap")
File.open(t,"w"){|f| f.print("abcd"*128)}

m = MMap.new(t)
raise "fail #{m[0...4]} == 'abcd'" unless m[0...4] == "abcd"
m[0]="xyz"
raise "fail #{m[0...4]} == 'xyzd'" unless m[0...4] == "xyzd"
