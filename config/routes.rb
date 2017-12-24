Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'yazi/:sef', to: 'posts#show', as: 'show_post'
  get 'etkinlik/:sef', to: 'activities#show', as: 'show_activity'
  get 'blog', to: 'posts#index', as: 'show_blog'
  get 'etkinlikler', to: 'activities#index', as: 'show_activities'
  get 'dokumantasyon', to: 'home#docs', as: 'oyak_doc'

  authenticate :user do
    scope :admin, module: :admin, as:'admin' do
      get '/', to: 'main#home',  as:"root"
      resources :posts
      resources :activities
    end
  end



end
