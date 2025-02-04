Rails.application.routes.draw do
  get "projects/index"
  get "projects/show"
  get "projects/create"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "projects#index"

  resources :projects, only: %i[new create index show] do
    resources :project_activities, only: [] do
      collection do
        post :create_comment
        post :update_status
      end
    end
  end
end
