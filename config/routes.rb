Rails.application.routes.draw do
  devise_for :users

  root to: "projects#index"
  resources :projects, only: [:index, :show] do
    resources :participations, only: [:create] do
      collection do 
        delete :destroy
      end
    end
  end
end
