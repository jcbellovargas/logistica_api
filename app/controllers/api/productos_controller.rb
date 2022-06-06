class Api::ProductosController < ApplicationController
  include Interactor

  def index
    render json: Producto.all
  end

  def create
    @producto = Producto.create(
      nombre: params[:nombre],
      descripcion: params[:descripcion],
      modelo: params[:modelo],
    )
    render json: @producto
  end
end
