# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sassffolding/version'

Gem::Specification.new do |s|
  s.name        = 'sassffolding'
  s.version     = Sassffolding::VERSION
  s.license     = 'MIT'
  s.date        = '2015-07-21'
  
  s.summary     = ""
  s.description = ""
  
  s.authors     = ["Paweł Rosa"]
  s.email       = 'pawel.t.rosa@gmail.com'
  s.homepage    = 'https://github.com/pawelrosa/sassffolding'
  
  s.files       = `git ls-files`.split("\n")
  s.require_paths = ['lib']
end