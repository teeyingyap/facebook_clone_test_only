Rails.application.routes.draw do
  root 'welcome#index'
  resource :session, controller: "sessions"
  resources :statuses, controller: "statuses"
  resources :likes

 resources :users do
   resources :statuses
 end

end
