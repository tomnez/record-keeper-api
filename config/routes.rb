Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  root 'root#index'

  resources :users, only: [] do
    resources :students, controller: :user_students, only: [:index]
  end

  resources :students, only: [] do
    resources :records, controller: :student_records, only: [:create, :index, :update, :delete]
  end
end
