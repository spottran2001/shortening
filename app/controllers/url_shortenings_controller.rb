# frozen_string_literal: true

class UrlShorteningsController < ActionController::API
  def index; end

  def encode
    short_url = UrlShortenings::Encode.new(encode_params).run
    if short_url
      render json: { short_url: short_url }
    else
      payload = {
        error: 'Invalid URL',
        status: 400
      }
      render json: payload, status: :bad_request
    end
  end

  def decode
    original_url = UrlShortenings::Decode.new(code_from_url).run
    render json: { original_url: original_url }
  end

  def show
    original_url = UrlShortenings::Decode.new(show_params).run
    redirect_to(original_url, allow_other_host: true)
  end

  private

  def encode_params
    params.require(:original_url)
  end

  def decode_params
    params.require(:short_url)
  end

  def show_params
    params.require(:id)
  end

  def code_from_url
    # Get code from url params
    decode_params.split('/').last
  end
end
