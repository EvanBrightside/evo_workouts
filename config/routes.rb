Rails.application.routes.draw do
  mount Tolk::Engine => '/tolk', :as => 'tolk'
    # ADMINOS ROUTES START

    devise_for :users, skip: :omniauth_callbacks

    devise_for :users, skip: [:session, :password, :registration, :confirmation],
      controllers: { omniauth_callbacks: 'authentications' }

    devise_scope :user do
      get 'authentications/new', to: 'authentications#new'
      post 'authentications/link', to: 'authentications#link'
    end


  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    namespace :admin do
    resources :custom_links, except: :show do
      collection { post :batch_action }
      member { post :duplication }
    end

    resources :measurements, except: :show do
      collection { post :batch_action }
      member { post :duplication }
    end

    resources :checklists, except: :show do
      collection { post :batch_action }
      member { post :duplication }
    end

    resources :training_videos, except: :show do
      collection { post :batch_action }
      member { post :duplication }
    end

    resources :days, except: :show do
      collection { post :batch_action }
      member { post :duplication }
    end

    resources :weeks, except: :show do
      collection { post :batch_action }
      member { post :duplication }
    end

      resources :helps, only: :index
      resource  :settings, only: [:edit, :update]

      resources :users, except: :show do
        collection { post :batch_action }
      end

      root to: 'admin#users'
    end

    root to: 'index/admin#users'
  end
    # ADMINOS ROUTES END
    devise_for :users, skip: :all
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
