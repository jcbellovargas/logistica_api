class Api::OperacionesController < ApplicationController
  include Interactor

  def index
    render json: Operacion.all
  end

  def create
    params[:usuario_id] = params[:usuario_id] || Usuario.first.id #TODO: manejo de usuario
    result = Transfer.call(params)

    if result.success?
      render json: { status: "OK", mensaje: "Transferencia realizada con exito" }
    else
      render json: { status: "ERROR", mensaje: result.mensaje }
    end
  end

  def get_by_destino
    result = Operacion.where(destino_id: params[:destino_id].to_i)

    render json: result.as_json
  end

  def destinos_mas_operados

  end
end