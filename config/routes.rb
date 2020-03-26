Rails.application.routes.draw do
  resources :bloggers, only: [:show, :new, :create]
  resources :destinations, only: [:show]
  resources :posts, except: [:destroy, :index]
  # resources :posts, to: :update_likes

  resources :posts do
    put :likes #put HTTP route that updates
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
