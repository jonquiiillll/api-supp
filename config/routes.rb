Rails.application.routes.draw do
  get 'admin_problems/index'
  get 'admin_users/index'
  resources :messages
  resources :conversations
  get 'chats/index'
  get 'rooms/index'
  resources :chats
  resources :users
  resources :rooms
  resources :tags
  resources :rooms
  resources :themes
  resources :problems
  resources :taggings
  get 'admin', to: 'admin_users#index'
  get 'admin_problems', to: 'admin_problems#index'
  root 'admin_users#index'
  get 'issues/index'
  get 'issues/create'
  get 'users/login'
  get 'issues/update'
  # get 'tags/:tag', to: 'users#index', as: :tag
  get 'issues/destroy'
  get 'themes/index'
  get 'conversations/index'
  get 'tags/index'

  resources :troubles
  
  resources :issues

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :troubles, only: %i[index show]
    end
  end
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :taggings, only: %i[index show]
    end
  end


  scope '/api/v2' do 
    resources :issues
end

  scope :api, defaults: { format: :json } do
    scope :v1 do
      resources :users, only: %i[index show]
      devise_for :users, defaults: { format: :json }, path: '', path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
      },
      
      controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }
    end
  end
end
