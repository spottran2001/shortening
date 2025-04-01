# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UrlShorteningsController do
  it 'get a shorten url by the link provided from user' do
    url = 'http://example.com'
    post :encode, params: { original_url: url }
    expect(JSON.parse(response.body)['short_url']).not_to be(nil)
  end

  it 'get a valid url of a valid code' do
    original_url = 'http://example.com'
    short_url = UrlShortening.create({ original_url: original_url }).code
    get :decode, params: { short_url: short_url }

    expect(JSON.parse(response.body)['original_url']).to eq(original_url)
  end

  it 'err with invalid host' do
    url = 'invalid_url'
    post :encode, params: { original_url: url }

    expect(JSON.parse(response.body)['status']).to eq(400)
    expect(JSON.parse(response.body)['error']).to eq('Invalid URL')
  end
end
