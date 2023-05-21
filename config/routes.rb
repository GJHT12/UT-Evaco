Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  devise_for :users, :controllers => {
 :registrations => 'users/registrations'
  }
  devise_scope :user do
    # TIPS: ユーザー登録しっぱいのリダイレクトのエラーを防ぐ https://github.com/heartcombo/devise/blob/master/app/controllers/devise/registrations_controller.rb
    get '/users', to: 'devise/registrations#new'
  end
  resources :users, only: [:show, :edit, :update]
  resources :evaluations do
    resources :opinions, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    get :search, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
