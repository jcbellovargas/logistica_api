class ValidarOperacion
  include Interactor

  after :set_context

  def call
    @cantidad = context.cantidad.to_i
    return context.fail!(mensaje: "Cantidad invalida") unless @cantidad > 0
    
    @origen = Local.find(context.origen_id)
    @destino = Local.find(context.destino_id)
    return context.fail!(mensaje: "Local inexistente") unless @origen.present? && @destino.present?

    # return context.fail!(mensaje: "El origen debe ser DEPOSITO") unless @origen.tipo_tienda == Local::DEPOSITO

    @producto = Producto.find(context.producto_id)
    return context.fail!(mensaje: "Producto inexistente") unless @producto.present?

    @usuario = Usuario.find(context.usuario_id)
    return context.fail!(mensaje: "Usuario inexistente") unless @usuario.present?
  end

  def set_context
    context.cantidad = @cantidad
    context.producto = @producto
    context.origen = @origen
    context.destino = @destino
    context.usuario = @usuario
  end

end