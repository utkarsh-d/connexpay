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

  s.required_ruby_version = '~> 2.0'
  s.files                 = ["lib/connexpay.rb"]
  s.require_paths         = ["lib"]
  s.add_runtime_dependency 'httparty'
end