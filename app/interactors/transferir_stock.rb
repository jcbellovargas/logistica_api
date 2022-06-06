class TransferirStock
  include Interactor

  def call
    cantidad = context.cantidad.to_i
    return context.fail!(mensaje: "Cantidad invalida") unless cantidad > 0
    
    origen = Local.find(context.origen_id)
    destino = Local.find(context.destino_id)
    return context.fail!(mensaje: "Local inexistente") unless origen.present? && destino.present?


    
    producto = Producto.find(context.producto_id)
    return context.fail!(mensaje: "Producto inexistente") unless producto.present?

    if origen.tiene_stock?(producto, cantidad)
      origen.reducir_stock(producto, cantidad)
      destino.aumentar_stock(producto, cantidad)
    else
      context.fail!(mensaje: "Stock insuficiente")
    end


    # if user = User.authenticate(context.email, context.password)
    #   context.user = user
    #   context.token = user.secret_token
    # else
    #   context.fail!(message: "authenticate_user.failure")
    # end
  end

  private

end



    #   params[:origen], 
    #   params[:destino],
    #   params[:producto_id],
    #   params[:cantidad]
    # )