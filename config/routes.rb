Rails.application.routes.draw do
  root "pages#home"

  resources :journal_entries

  get "up" => "rails/health#show", as: :rails_health_check
end
