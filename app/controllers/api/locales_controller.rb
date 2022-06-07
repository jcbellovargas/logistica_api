class Api::LocalesController < ApplicationController
  include Interactor

  def index
    render json: Local.all.as_json
  end

  def create
    @local = Local.create(
      nombre: params[:nombre],
      localidad: params[:localidad],
      provincia: params[:provincia],
      tipo_local: params[:tipo_local]
    )
    render json: @local
  end

  def tiendas
    render json: Local.where(tipo_local: Local::TIENDA).as_json
  end

  def depositos
    render json: Local.where(tipo_local: Local::DEPOSITO).as_json
  end
end
