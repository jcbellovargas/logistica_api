class TransferirStock
  include Interactor

  def call
    if context.origen.tiene_stock?(context.producto, context.cantidad)
      context.origen.reducir_stock(context.producto, context.cantidad)
      context.destino.aumentar_stock(context.producto, context.cantidad)
    else
      context.fail!(mensaje: "Stock insuficiente")
    end
  end

end