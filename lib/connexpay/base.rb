module Connexpay
  class Base

    # end point
    def end_point
      # defined?(Rails) && Rails.env == 'production' ? self.production_url : self.test_url
      false ? live_url : test_url
    end

    def config
      Connexpay.configuration || Connexpay::Configuration.new
    end

  end
end