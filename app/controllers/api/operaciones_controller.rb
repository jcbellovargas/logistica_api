class Api::OperacionesController < ApplicationController
  include Interactor

  def index
    @operaciones = Operacion.all
    render json: @operaciones
  end

  def create
    result = TransferirStock.call(params)

    render json: result
  end
end
