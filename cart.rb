require './product.rb'
class ShoppingCart
  def initialize
    @cart = []
  end

  def add_product(name, price, tax)
    @cart << Product.new(name, price, tax)
  end

  def remove_product(product)
    counter = 0
    @cart.each do |i|
      if i.name == product
        @cart.delete(i)
      elsif product != i.name
        counter += 1
      end
    end
    if counter == @cart.length
      puts "You don't have #{product} in cart!"
    end
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
    @cart
  end

end

my_cart = ShoppingCart.new
puts my_cart.whats_in_cart.inspect

my_cart.add_product("Tooth brush", 7.99, 0.13)
my_cart.add_product("Bananas", 4.99, 0)
my_cart.add_product("Milk", 5.65, 0)
my_cart.add_product("Bedsheet", 60.99, 0.13)

puts my_cart.whats_in_cart.inspect
puts "Total before tax: $#{my_cart.total_before_tax}"
puts "Total after tax: $#{my_cart.total_after_tax}"

my_cart.remove_product("Milk")
my_cart.remove_product("Card")
puts my_cart.whats_in_cart.inspect

puts "Total before tax: $#{my_cart.total_before_tax}"
puts "Total after tax: $#{my_cart.total_after_tax}"
