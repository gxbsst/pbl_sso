Rails.application.routes.draw do
  mount CASino::Engine => '/', :as => 'casino'

  namespace :pbl do
    resources :sessions, only: %w(new)
  end
end
