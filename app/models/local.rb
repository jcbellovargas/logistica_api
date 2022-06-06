class Local < ApplicationRecord
  require "pry"
  has_many :stock, class_name: "ItemStock"
  has_many :productos, through: :stock

  def tiene_stock?(producto, cantidad)
    stock.any? { |item| item.producto.nombre == producto.nombre && item.cantidad >= cantidad}
  end

  def aumentar_stock(producto, cantidad)
    item_stock = stock.find { |item| item.producto.id == producto.id }
    if item_stock.present?
      item_stock.cantidad += cantidad
      item_stock.save!
    else
      stock << ItemStock.create(producto: producto, cantidad: cantidad)
    end
  end

  def reducir_stock(producto, cantidad)
    item_stock = stock.find { |item| item.producto.id == producto.id }
    if item_stock.present?
      item_stock.cantidad -= cantidad
      item_stock.save!
      if item_stock.cantidad <= 0
        stock.delete(item_stock)
        item_stock.delete
      end
    end
  end

end
