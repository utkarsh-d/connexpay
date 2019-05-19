module Connexpay
  class Configuration
    attr_accessor :username, :password, :grant_type #, :merchant_id, :device_id, :token_expire_hours

    def initialize
      @username   = 'username'
      @password   = 'password'
      @grant_type = 'grant_type'
      # @merchant_id: 3fdf172b-f5d4-49d4-9fa5-41d8c1c79bd4
      # @device_id: 58a2abe3-133e-44fc-8a77-16f2d10cf9
      # @token_expire_hours: 24
      # @username: 'srai'
      # @password: 'Aa186a8c69a8f'
    end
  end
end