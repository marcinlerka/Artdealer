Artdealer::Application.routes.draw do

  devise_for :users, :path_names => { :sign_up => "register", :sign_in => "login" }

  resources :users, :only => [:index, :show] do
    resources :artworks
  end

  root :to => "home#index"

end
