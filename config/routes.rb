Webistrano::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete '/logout' => 'devise/sessions#destroy', as: :logout
  end
  root :to => 'projects#dashboard'

  # TODO - where is this used? -- fd
  match ':controller/service.wsdl' => '#wsdl'

  resources :hosts

  resources :recipes do
    collection do
      get :preview
    end
  end

  resources :projects do
    resources :project_configurations
    resources :stages do
      member do
        get  :tasks
        get  :capfile
        get  :recipes
        put  :recipes
      end
      resources :stage_configurations
      resources :roles
      resources :deployments do
        collection do
          get :latest
        end
        member do
          post :cancel
        end
      end
    end
  end

  resources :users do
    member do
      post :enable
      get :deployments
    end
  end

  # devise_for :users
  # resources :sessions, only: [:new, :create, :destroy]
  # match 'login' => 'sessions#new', as: :login
  # match 'logout' => 'sessions#destroy', as: :logout
end
