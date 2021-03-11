Rails.application.routes.draw do
  root to: 'hostel_operation#index'
  devise_for :users, controllers: {registrations: 'user/registrations' , sessions: 'user/sessions' }
  get 'owner/all_request'
  get 'leave/show_owner'
  get 'room_management/get_all_room'
  resources :hostel_operation
  post 'hostel_operation/check_auth'
  resources :room_management
  resources :owner
  resources :student do
    resources :leave
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
