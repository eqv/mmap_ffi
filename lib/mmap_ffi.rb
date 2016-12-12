require 'ffi'

class MMap

  PROT_READ       = 0x01
  PROT_WRITE      = 0x02
  PROT_EXEC       = 0x04

  MAP_SHARED      = 0x01
  MAP_PRIVATE     = 0x02

  attr_accessor :size

  module FFIMMap
    extend FFI::Library
    ffi_lib 'c'
    attach_function :mmap, [ :pointer, :size_t, :int, :int, :int, :int ], :pointer
  end

  def initialize(file, size = nil, prot = PROT_READ | PROT_WRITE, map = MAP_SHARED)
    @size = file.size
    @ptr = FFIMMap.mmap( FFI::Pointer.new(:void,0), @size, prot, map , file.fileno, 0 )
  end

  def [](range)
    raise "expected to index mmap reads with ranges, got #{range.class}" unless range.is_a? Range
    range = range.min..[range.max, @size-1].min
    return nil unless range.min # nil if min > max
    (@ptr+range.min).read_bytes(range.size)
  end

  def []=(key, value)
    raise "expected to index mmap writes with ints, got #{key.class}" unless key.is_a? Integer
    return nil if(key >= @size)
    endoffset = [value.size, @size-1-key].min
    (@ptr+key).write_bytes( value[0..endoffset] )
  end
end
