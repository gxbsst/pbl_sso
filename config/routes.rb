Rails.application.routes.draw do
  match 'logout', to: 'casino/sessions#logout', via: :all

  mount CASino::Engine => '/', :as => 'casino'

  namespace :pbl do
    resources :sessions, only: %w(new)
  end
end
