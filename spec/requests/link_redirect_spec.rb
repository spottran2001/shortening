# frozen_string_literal: true

RSpec.describe 'LinkRedirect', type: :request do
  it 'redirect to original url' do
    original_url = 'http://example.com/'
    code = UrlShortening.create({ original_url: original_url }).code
    get "/#{code}"

    expect(response).to redirect_to(original_url)
  end
end
