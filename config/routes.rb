Rails.application.routes.draw do
  root "url_shortenings#index"
  post "encode" => "url_shortenings#encode"
  get "decode" => "url_shortenings#decode"
  get ":id" => "url_shortenings#show"
end
