class Product < ApplicationRecord
  def tax
    t = 0.01
    t = price * t
  end

  def total
    price + T
  end
end
