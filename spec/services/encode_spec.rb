# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UrlShortenings::Encode do
  it 'gives each URL its own code' do
    url = 'http://example.com'
    encode_service = UrlShortenings::Encode.new(url)
    code1 = encode_service.run

    url = 'http://example2.com'
    encode_service = UrlShortenings::Encode.new(url)
    code2 = encode_service.run

    expect(code1).not_to eq(code2)
  end

  it 'gives same code for same URL' do
    url = 'http://example.com'
    encode_service = UrlShortenings::Encode.new(url)
    code1 = encode_service.run

    url = 'http://example.com'
    encode_service = UrlShortenings::Encode.new(url)
    code2 = encode_service.run

    expect(code1).to eq(code2)
  end
end
