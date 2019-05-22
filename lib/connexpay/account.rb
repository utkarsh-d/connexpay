# Accounts
# Refer: https://developers.connexpay.com/#accounts

module Connexpay
  class Account < Connexpay::Base

    def create_token
      begin
        response = HTTParty.post(end_point,
                                { headers: { "Content-Type" => "application/x-www-form-urlencoded" },
                                body: { username: config.username, password: config.password, grant_type: config.grant_type } })
        response.parsed_response
      rescue => exception
        { 'error' => exception.message }
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