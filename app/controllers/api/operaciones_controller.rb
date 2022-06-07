class Api::OperacionesController < ApplicationController
  include Interactor

  def index
    render json: Operacion.all.as_json
  end

  def create
    params[:usuario_id] = params[:usuario_id] # || Usuario.first.id
    result = Transfer.call(params)

    if result.success?
      render json: { status: "OK", mensaje: "Transferencia realizada con exito!" }
    else
      render json: { status: "ERROR", mensaje: result.mensaje }
    end
  end

  def get_by_destino
    result = OperacionesPorDestino.call(params)

    render json: result.operaciones.as_json
  end

  def get_operaciones_del_dia_por_destino
    result = OperacionesDelDia.call

    render json: result.operaciones.as_json
  end

  def get_by_tienda_fecha
    result = OperacionesPorFecha.call(params)

    render json: result.operaciones.as_json
  end
end