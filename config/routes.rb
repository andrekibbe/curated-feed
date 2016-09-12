Rails.application.routes.draw do
  # create routes for editing and updated user interests
  resources :users, only: [:edit, :update]

  devise_for :users, controllers: { registrations: "registrations" }
  # create routes for perfoming all CRUD operations on posts
  resources :posts

  # For authenticated users to root_path maps to the feed action of the post_controller
  authenticated :user do
    root 'posts#feed', as: 'authenticated_root'
  end

  root 'posts#index'
end
