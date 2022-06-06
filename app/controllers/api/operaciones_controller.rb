class Api::OperacionesController < ApplicationController
  include Interactor

  def index
    render json: Operacion.all
  end

  def create
    result = TransferirStock.call(params)

    if result.success?
      Operacion.create(
        origen: result.origen,
        destino: result.destino,
        usuario: result.usuario,
        producto: result.producto,
        fecha: result.fecha
      )
      render json: { status: "OK", mensaje: "Transferencia realizada con exito" }
    else
      render json: { status: "ERROR", mensaje: result.mensaje }
    end
  end
end
