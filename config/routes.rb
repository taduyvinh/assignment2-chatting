Rails.application.routes.draw do

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"
  
  resources :users 

  resources :friendships
  post "friendships/new" => "friendships#create"

  resources :messages do 
     collection do
       get 'incoming' 
     end

     member do
       post 'mark_as_read'
     end
  end
  
  get "sent_messages" => "messages#sent_messages"


  post 'message_create' => 'messages#create'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
