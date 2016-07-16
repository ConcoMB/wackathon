Rails.application.routes.draw do
  devise_for :backoffice_administrators
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: "projects#index"
  resources :projects, only: [:index] do
    resources :participations, only: [:create] do
      collection do
        delete :destroy
      end
    end
  end
end
