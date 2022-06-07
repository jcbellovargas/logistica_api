class Operacion < ApplicationRecord
  belongs_to :usuario
  belongs_to :origen, class_name: "Local"
  belongs_to :destino, class_name: "Local"
  belongs_to :producto

  def as_json
    super(
      include: [
        origen: { only: [:id, :nombre, :localidad, :provincia, :tipo_local] },
        destino: { only: [:id, :nombre, :localidad, :provincia, :tipo_local] }, 
        producto: { only: [:id, :nombre, :modelo] }, 
        usuario: { only:[:id, :nombre] }
      ],
      only: [:id, :origen, :destino, :producto, :usuario, :cantidad, :fecha]
    )
  end
end
