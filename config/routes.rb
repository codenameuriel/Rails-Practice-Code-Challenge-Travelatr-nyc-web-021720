Rails.application.routes.draw do
  resources :bloggers, only: [:show, :new, :create]
  resources :destinations, only: [:show]
  resources :posts, except: [:index, :destroy]

  # member route
  resources :posts do
    #creates a PATCH route (modifies specific attribute) for the likes action in posts controller
    patch :likes, on: :member
    # creates likes_post_path 
  end
end