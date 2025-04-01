# frozen_string_literal: true

class UrlShortening < ApplicationRecord
  before_create :set_code

  validates_presence_of :original_url
  validate :original_url_format

  def set_code
    self.code = UrlShortenings::Encode.new(original_url).generate_code
  end

  def original_url_format
    # Skip validation if original_url is nil
    return unless original_url

    uri = URI.parse(original_url)
    errors.add(:original_url, 'is not a valid url') if uri.host.nil?
  end
end
