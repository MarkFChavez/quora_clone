Rails.application.routes.draw do
  root "home#show"

  get "/auth/facebook/callback" => "sessions#create"
end
