# coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/connexpay/version'
Gem::Specification.new do |s|
  s.name          = 'connexpay'
  s.version       = Connexpay::VERSION
  s.date          = '2019-05-18'
  s.summary       = "Connexpay - simply connecting payments."
  s.description   = "Transforming Payment Acceptance & Issuance for Travel & E-commerce Providers."
  s.authors       = ["Sandeep Tota", "Utkarsh Dwivedi"]
  s.email         = ["isandeepthota@gmail.com", "utkarsh.dwivedi0393@gmail.com"]
  s.homepage      = 'https://connexpay.com/'
  s.license       = 'MIT'

  #  specify re=uby version
  s.files         = ["lib/connexpay.rb"]
  s.require_paths = ["lib"]
  s.add_runtime_dependency 'httparty'
  # s.add_runtime_dependency 'activesupport'
end