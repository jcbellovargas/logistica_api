class OperacionesPorFecha
  include Interactor

  def call
    inicio = DateTime.parse(context.fecha_inicio)
    fin = DateTime.parse(context.fecha_fin)

    context.operaciones = Operacion
      .where(destino_id: context.destino_id.to_i)
      .where(fecha: inicio..fin)
      .limit(10)

    context.fail!(mensaje: "Error al obtener los datos de operacion") if context.operaciones.blank?
  end

end