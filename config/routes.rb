Rails.application.routes.draw do
  devise_for :customers
  devise_for :customers, skip: [:session, :password, :registration, :confirmation]
  devise_scope :customer do
    get 'authentications/new', to: 'authentications#new'
    post 'authentications/link', to: 'authentications#link'
  end

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

      resources :customers, except: :show do
        collection { post :batch_action }
      end

      root to: 'users#index'
    end
    root to: 'days#index'

    resources :days do
      get 'training_description', on: :collection
    end
  end
end
