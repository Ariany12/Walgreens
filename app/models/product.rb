class Product < ApplicationRecord
  def tax
    tax = 0.01
    tax = price * tax
  end

  def total
    price +  tax
  end
end
