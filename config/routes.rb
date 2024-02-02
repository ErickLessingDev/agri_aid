Rails.application.routes.draw do
  root 'home#index'
  resources :cattles, only: [:index, :new, :create, :show, :edit, :update, :destroy, :delete]
end
