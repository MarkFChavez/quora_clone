Rails.application.routes.draw do
  root "home#show"
  get "/auth/facebook/callback" => "sessions#create"
  get "/signin" => "sessions#new", as: :signin
  delete "/signout" => "sessions#destroy", as: :signout
end
