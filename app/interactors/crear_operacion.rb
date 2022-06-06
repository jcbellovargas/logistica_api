class CrearOperacion
  include Interactor

  def call
    op = Operacion.create(
      origen: context.origen,
      destino: context.destino,
      usuario: context.usuario,
      producto: context.producto,
      cantidad: context.cantidad,
      fecha: DateTime.now
    )
    context.fail!(mensaje: "Error al crear la operacion") if op.id.blank?
  end

end