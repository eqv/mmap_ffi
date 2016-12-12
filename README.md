MMAP FFI
=======

A very simple ffi wrapper for the mmap system call. It only allows to map a file and perform simple read and write operations.

```
t = Tempfile.new("mmap")
File.open(t,"w"){|f| f.print("abcd"*128)}

m = MMap.new(t)
puts m[0...4] # => "abcd"
m[0]="xyz"
puts m[0...4] # => "xyzd"
```
