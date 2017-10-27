Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'yazi/:sef', to: 'home#post', as: 'show_post'
  get 'blog', to: 'home#blog', as: 'show_blog'
  get 'dokumantasyon', to: 'home#docs', as: 'oyak_doc'

  authenticate :user do
    scope :admin, module: :admin, as:'admin' do
      get '/', to: 'main#home',  as:"root"
      resources :posts
    end
  end



end
