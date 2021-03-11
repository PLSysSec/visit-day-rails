Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  devise_scope :user do 
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: "home#welcome"

    get 'schedules', to: 'home#schedules', as: 'all_schedules'
    

    namespace :admin do
      get 'home'
    end
    
    resources :schedule_items do
      delete 'attendee/:attendee_id', to: "schedule_items#remove_attendee", as: "remove_attendee"
      post 'attendee/:attendee_id', to: "schedule_items#add_attendee", as: "add_attendee"
    end

    get 'global/schedule', to: "schedule_items#global", as: 'global_schedule'
    
    resources :people do
      get 'schedule', to: "schedule_items#for_person"
    end
  end
end
