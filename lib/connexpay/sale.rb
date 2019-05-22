# Sale
# Refer: https://developers.connexpay.com/#sale

module Connexpay
  class Sale < Connexpay::Base

    def create_sale(token, query_params)
      begin
        response = HTTParty.post(end_point, {
                                headers: { "Content-Type" => "application/json", "Authorization" => token },
                                body: query_params })
        response.parsed_response
      rescue => exception
        { 'error' => exception.message }
      end
    end

    private

    def live_url
      'https://salesapi.connexpay.com/api/v1/sales'
    end

    def test_url
      'https://sandboxsalesapi.connexpay.com/api/v1/sales'
    end
  end
end