Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'yazi/:sef', to: 'home#post', as: 'show_post'
  get 'blog', to: 'home#blog', as: 'show_blog'
  get 'dokumantasyon', to: 'home#docs', as: 'oyak_doc'

  scope :admin, module: :admin do
    resources :posts
  end



end
