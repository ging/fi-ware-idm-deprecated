FiWareIdm::Application.routes.draw do
  # FIWARE compatible routes
  match '/authorize', to: 'authorizations#new'
  post  '/token', to: proc { |env| SocialStream::Oauth2Server::TokenEndpoint.new.call(env) }

  devise_for :users, :controllers => {:omniauth_callbacks => 'omniauth_callbacks', registrations: 'user_registrations', sessions: 'user_sessions'}
  
  namespace :permission do
    resources :customs
  end

  resources :purchases
  resources :roles

  #Role Assignment. REST API
  match '/applications/:app_id/actors' => "applications#index_actors", :via => :get, :format => :json
  match '/applications/:app_id/actors' => "applications#create_actor", :via => :post, :format => :json
  match '/applications/:app_id/actors/:actor_id' => "applications#show_actor", :via => :get, :format => :json
  match '/applications/:app_id/actors/:actor_id' => "applications#update_actor", :via => :put, :format => :json
  match '/applications/:app_id/actors/:actor_id' => "applications#delete_actor", :via => :delete, :format => :json

  #Authentication Token API
  namespace :api do
    namespace :v1  do
      resources :tokens,:only => [:create, :destroy]
    end
  end


  resources :external_idps
  resources :external_sps
  

  #SCIM 2.0 API
  namespace :v2 do
    resources :users
    resources :organizations
    match '/ServiceProviderConfigs' => "base#getConfig"
    match '/testing' => "base#testing"
  end

  match '/terms-of-service' => 'frontpage#terms_of_service', as: :terms_of_service
end
