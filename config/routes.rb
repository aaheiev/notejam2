Rails.application.routes.draw do
  root 'static_pages#home'
  # get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  Healthcheck.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/version', to: 'application#version', as: 'version'
  # root 'application#hello'
end
