Rails.application.routes.draw do
  get "posts/index" => "posts#index"

  resources :posts do
    collection do
      post :confirm
    end
  end

  get "/" => "home#top"
  get "about" => "home#about"
  

end