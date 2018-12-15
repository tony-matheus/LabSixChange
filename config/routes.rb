Rails.application.routes.draw do
  # get 'exchanges/index'
  # get 'exchanges/exchange'

  root 'exchanges#index'
  get 'convert', to: 'exchanges#convert'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
