Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  devise_scope :user do 
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "home#index"

    namespace :admin do
      get 'home'
    end
   
    scope :admin do
      resources :students
    end

    scope :schedule do
      get '', to: 'schedule#all'
      get ':group_name', to: 'schedule#group'
    end

  end
end
