# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :glossaries, only: %i[index show create] do
    resources :terms, only: %i[create]
  end
  resources :translations, only: %i[show create]
end
