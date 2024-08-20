Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist, to: 'gists#create'
    end
  end

  namespace :admin do
    resources :badges, only: %i[index new create destroy]
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  resources :feedbacks, only: :create
  get 'feedbacks', to: 'feedbacks#new', as: 'new_feedback'

  resources :badges, only: :index
  get 'my_badges', to: 'badges#my_badges', as: 'my_badges'
end
