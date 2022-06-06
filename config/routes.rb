Rails.application.routes.draw do
  namespace :api do
    resources :productos, only: [:create, :index, :show] do

    end

    resources :usuarios, only: [:create, :index] do 

    end
    resources :locales, only: [:create, :index] do 

    end
    resources :operaciones, only: [:create, :index, :show] do

    end
  end 
end
