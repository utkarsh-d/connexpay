module Connexpay
  class Configuration
    attr_accessor :username, :password, :grant_type, :merchant_id, :device_id

    def initialize
      @username    = 'username'
      @password    = 'password'
      @grant_type  = 'grant_type'
      @merchant_id = 'merchant_id'
      @device_id   = 'device_id'
    end
  end
end