# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UrlShortenings::Decode do
  it 'get a valid url of a valid code' do
    url = 'http://example.com'
    encode_service = UrlShortenings::Encode.new(url)
    encode_service.run

    code = UrlShortening.last.code

    decode_service = UrlShortenings::Decode.new(code)
    decoded_url = decode_service.run

    expect(decoded_url).to eq(url)
  end

  it 'the response is not nil with the invalid code' do
    code = 'this_is_invalid_code'
    decoded_url = UrlShortenings::Decode.new(code).run

    expect(decoded_url).to eq(ENV.fetch('DOMAIN', nil))
  end
end
