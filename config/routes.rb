PingMe::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  unauthenticated do
    root :to => "static_pages#homepage"
  end
  
  authenticated do
    root :to => "temporary_contact_details#index"
    resources :temporary_contact_details, :only => [:index, :create] do
      get :delete, :to => :destroy
    end
    put :user, :to => "user#update", :as => :update_current_user
  end
  
  get "i/:id", :to => "temporary_contact_details#show", :as => :temporary_link
  
  post "inbound_email", :to => "inbound_emails#create"
end
