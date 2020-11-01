Rails.application.routes.draw do
  Healthcheck.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/version', to: 'application#version', as: 'version'
  root 'application#hello'
end
