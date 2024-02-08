require 'sidekiq/web'

Rails.application.routes.draw do
  
  root 'cattles#index'
  resources :cattles do
    get 'new_weigh', to: 'cattles#new_weigh', on: :member
    post 'weigh', to: 'cattles#create_weigh', on: :member
    
    collection do
      get 'download_template' => 'cattles#download_template'
      get 'upload_csv' => 'cattles#upload_csv'
      post 'upload_csv' => 'cattles#process_csv' 
    end
  end

  # Mount Sidekiq web interface
  mount Sidekiq::Web => '/sidekiq'
end
