require_relative 'connexpay/configuration'
require_relative 'connexpay/base'
require_relative 'connexpay/account'
# require 'connexpay/device'
require_relative 'connexpay/sale'
# require 'connexpay/void'
# require 'connexpay/return'
# require 'connexpay/verify'
# require 'connexpay/search'

require 'httparty'

module Connexpay

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Connexpay::Configuration.new
    yield(configuration)
  end
  
  def self.generate_token
    Connexpay::Account.new.create_token
  end
end