Rails.application.routes.draw do
  namespace :api do
    resources :productos, only: [:create, :index, :show] do
    end

    resources :usuarios, only: [:create, :index] do 
    end

    resources :locales, only: [:create, :index] do 
    end

    resources :operaciones, only: [:create, :index] do
    end
    
    get 'operaciones/destino', to: 'operaciones#get_by_destino'
    get 'operaciones/por_tienda_fecha', to: 'operaciones#get_by_tienda_fecha'
    get 'operaciones/operaciones_del_dia', to: 'operaciones#get_operaciones_del_dia_por_destino'
    get 'locales/tiendas', to: 'locales#tiendas'
    get 'locales/depositos', to: 'locales#depositos'
    get 'usuarios/login', to: 'usuarios#login'
  end 
end
