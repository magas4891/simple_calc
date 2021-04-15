Rails.application.routes.draw do
  root 'calculations#index'
  post '/calculations/', to: 'calculations#create'
end
