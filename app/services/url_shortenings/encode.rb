# frozen_string_literal: true

module UrlShortenings
  class Encode
    def initialize(original_url)
      @original_url = original_url
    end

    def run
      # Use old record if have
      url_shortening = UrlShortening.where(original_url: @original_url).first_or_create

      return false unless url_shortening.valid?

      # Return short url
      ENV.fetch('DOMAIN', nil) + url_shortening.code
    end

    def generate_code
      count = 0
      loop do
        code = encode(count)

        # make sure that the code is unique
        break code unless UrlShortening.exists?(code: code)

        # Scale up range of code length if it exist to make it harder to duplication
        count += 1
      end
    end

    def encode(count = 0)
      # Generate code with length range
      SecureRandom.urlsafe_base64[0, count + 6]
    end
  end
end
