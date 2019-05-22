module Connexpay
  class Base

    private

    # end point
    def end_point
      defined?(Rails) && Rails.env == 'production' ? self.production_url : self.test_url
    end

    def config
      Connexpay.configuration || Connexpay::Configuration.new
    end

  end
end