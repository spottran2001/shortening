# frozen_string_literal: true

require 'base64'

module UrlShortenings
  class Decode
    def initialize(code)
      @code = code
    end

    def run
      url_shortening = UrlShortening.find_by(code: @code)
      # Make sure that the response is not nil
      url_shortening ? url_shortening.original_url : ENV.fetch('DOMAIN', nil)
    end
  end
end
