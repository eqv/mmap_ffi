require_relative './lib/version.rb'

Gem::Specification.new do |s|
  s.name        = 'mmap_ffi'
  s.version     =  MMap::Version
  s.date        = '2016-12-12'
  s.summary     = "FFI wrapper to mmap"
  s.description = "A simple ffi wrappe to use mmap for IPC"
  s.authors     = ["Cornelius Aschermann"]
  s.email       = 'coco@hexgolems.com'
  s.files       = ["lib/mmap_ffi.rb", "lib/version.rb"]
  s.homepage    = 'https://github.com/eqv/mmap_ffi'
  s.license       = 'MIT'
end
