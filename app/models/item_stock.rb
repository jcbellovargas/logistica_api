class ItemStock < ApplicationRecord
  belongs_to :producto
  belongs_to :local, optional: true
  belongs_to :operacion, optional: true
end
