# Accounts
# Token

# This endpoint creates a sysadmin token.

# HTTP Request
# POST https://sandboxsalesapi.connexpay.com/api/v1/token

# Headers
# Key Value
# Content-Type  application/x-www-form-urlencoded
# 
# Body
# Parameter   Type    M/C/O Value
# grant_type  string  Mandatory password.
# username    string  Mandatory Username of the sysadmin.
# password    string  Mandatory Password of the sysadmin.
# 
# Response
# 200 code (ok).

module Connexpay
  class Account < Connexpay::Base
    
    def create_token
      begin
        response = HTTParty.post(end_point,
                                { headers: { "Content-Type" => "application/x-www-form-urlencoded" },
                                body: { username: config.username, password: config.password, grant_type: config.grant_type } })
        response.ok? ? response.parsed_response : 'some error occured.'
        # puts end_point
        # puts config.username
      rescue => exception
        exeption.message
      end
    end

    private

    def live_url
      'https://salesapi.connexpay.com/api/v1/token'
    end

    def test_url
      'https://sandboxsalesapi.connexpay.com/api/v1/token'
    end
  end
end