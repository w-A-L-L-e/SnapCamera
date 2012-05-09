Railstest::Application.routes.draw do
  resources :webcam_pictures
  resources :posts
  root :to => 'webcam_pictures#index'
end

