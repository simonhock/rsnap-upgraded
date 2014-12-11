Rsnap::Application.routes.draw do
  resources :programs

  resources :file_missions

  resources :missions
  resources :chapters
  get '/chapters/:id/add_mission/', to:'missions#index'
  get '/chapter_missions/:id', to:'chapter_missions#show'
  resources :mission_programs, :only=>[:show, :update]
  resources :sort_missions, :only=>:update
  resources :initialization_program_missions, :only=>[:new]

  resources :projects

  devise_for :users, :path => "auth", :controllers => { :registrations => "registrations" }
  resources :users

  resources :snap_assets, :only=>:index

  resources :home, :only=>:index do
    collection do
      get :about
      get :after_missions_form
    end
  end
  root :to => "home#index"
end
