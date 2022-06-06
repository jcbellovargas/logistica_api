class Api::OperacionesController < ApplicationController
  include Interactor

  def index
    render json: Operacion.all
  end

  def create
    params[:usuario_id] = params[:usuario_id] || Usuario.first.id
    result = Transfer.call(params)

    if result.success?
      render json: { status: "OK", mensaje: "Transferencia realizada con exito" }
    else
      render json: { status: "ERROR", mensaje: result.mensaje }
    end
  end
end
