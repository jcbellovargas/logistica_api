class OperacionesDelDia
  include Interactor

  def call
    destinos = Operacion
                .where("DATE(fecha) = ?", Date.today)
                .having('COUNT(destino_id) > 3')
                .group('destino_id')
                .count

    destino_ids = destinos.keys

    context.operaciones = Operacion
              .where("DATE(fecha) = ?", Date.today)
              .where(destino_id: destino_ids)
              .order(fecha: :asc)
    
    context.fail!(mensaje: "Error al obtener los datos de operacion") if context.operaciones.blank?
  end

end