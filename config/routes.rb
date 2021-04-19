# frozen_string_literal: true

Rails.application.routes.draw do
  root 'calculations#index'
  post '/calculations/', to: 'calculations#create'
end
