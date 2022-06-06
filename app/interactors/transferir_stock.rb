class TransferirStock
  include Interactor

  def call
    cantidad = context.cantidad.to_i
    return context.fail!(mensaje: "Cantidad invalida") unless cantidad > 0
    
    context.origen = Local.find(context.origen_id)
    context.destino = Local.find(context.destino_id)
    return context.fail!(mensaje: "Local inexistente") unless origen.present? && destino.present?

    context.producto = Producto.find(context.producto_id)
    return context.fail!(mensaje: "Producto inexistente") unless producto.present?

    if origen.tiene_stock?(producto, cantidad)
      origen.reducir_stock(producto, cantidad)
      destino.aumentar_stock(producto, cantidad)
      context.fecha = DateTime.now
    else
      context.fail!(mensaje: "Stock insuficiente")
    end
  end

end