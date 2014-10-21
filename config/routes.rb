require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    member do
      post "follow" => "follows#create"
      delete "follow" => "follows#destory"
    end
  end

  resources :shouts, only: [:new, :create, :show]

  get "/sign_up" => "users#new"
  get "/sign_in" => "sessions#new"

  root to: "sessions#new"

end
