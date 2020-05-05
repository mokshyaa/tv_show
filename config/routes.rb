Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'}
  resources :shows do
    member do
      put :faviourite
    end
    collection do
      get :schedule_mail
    end
  end
  resources :channels
  root to: "homes#index"
end
