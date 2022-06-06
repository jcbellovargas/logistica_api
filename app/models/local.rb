class Local < ApplicationRecord
  has_many :stock, class_name: "ItemStock"
  has_many :productos, through: :stock
end
