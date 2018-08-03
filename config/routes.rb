Rails.application.routes.draw do

  defaults format: :json do
    resources :users
    resources :posts, only: :index
  end


  root :to => "application#index"
  match "*path", to: "application#index", format: false, via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
