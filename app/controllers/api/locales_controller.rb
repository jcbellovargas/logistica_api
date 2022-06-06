class Api::LocalesController < ApplicationController
  include Interactor

  def index
    render json: Local.all
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
end
