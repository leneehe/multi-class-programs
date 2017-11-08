require './product.rb'
class ShoppingCart
  def initialize
    @cart = []
  end

  def add_product(product)
    @cart << product
  end

  def remove_product(product)
    @cart.delete(product)
  end

  def total_after_tax
    t_after_tax = 0
    @cart.each do |product|
      t_after_tax += product.total_price
    end
    return t_after_tax.round(2)
  end

  def total_before_tax
    total = 0
    @cart.each do |product|
      total += product.base_price
    end
    return total.round(2)
  end

  def whats_in_cart
    @cart.inspect
  end

end

item1 = Product.new("Tooth brush", 7.99, 0.13)
item2 = Product.new("Bananas", 4.99, 0)
item3 = Product.new("Milk", 5.65, 0)
item4 = Product.new("Bedsheet", 60.99, 0.13)
my_cart = ShoppingCart.new
puts my_cart.whats_in_cart

my_cart.add_product(item1)
my_cart.add_product(item2)
my_cart.add_product(item3)
my_cart.add_product(item4)

puts my_cart.whats_in_cart
puts "Total before tax: $#{my_cart.total_before_tax}"
puts "Total after tax: $#{my_cart.total_after_tax}"

my_cart.remove_product(item3)
puts my_cart.whats_in_cart

puts "Total before tax: $#{my_cart.total_before_tax}"
puts "Total after tax: $#{my_cart.total_after_tax}"
