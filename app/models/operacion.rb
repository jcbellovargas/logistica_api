class Operacion < ApplicationRecord
  belongs_to :usuario
  belongs_to :origen, class_name: "Local"
  belongs_to :destino, class_name: "Local"
  has_many :stock, class_name: "ItemStock"
end
