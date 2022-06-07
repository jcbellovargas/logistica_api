class Producto < ApplicationRecord
  def as_json
    super({ only: [:id, :nombre, :descripcion, :modelo]})
  end
end
