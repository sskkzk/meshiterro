Rails.application.routes.draw do
 
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get 'homes/about', to: 'homes#about', as: 'about'
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    # 今まではresourcesでしたが、ここでは、resourceとなっている点に注目してください。 単数形にすると、/:idがURLに含まれなくなります。
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
