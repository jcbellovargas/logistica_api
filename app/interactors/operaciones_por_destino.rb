class OperacionesPorDestino
  include Interactor

  def call
    context.operaciones = Operacion.where(destino_id: context.destino_id.to_i).order(fecha: :desc)
    
    context.fail!(mensaje: "Error al obtener los datos de operacion") if context.operaciones.blank?
  end

end