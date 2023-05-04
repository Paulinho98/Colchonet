Colchonet::Application.routes.draw do
  resources :customers
  LOCALES = /en|pt\-BR/

  scope "(:locale)", :locale => LOCALES do
    resources :rooms
    resources :users

    resource :user_confirmation, :only => [:show]

    resource :user_sessions, :only => [:create, :new, :destroy]
  end
  
  get '/:locale' => 'home#index', :locale => LOCALES
  root :to => "home#index"

end
