class Product

  def initialize(name, price, tax)
    @name = name
    @base_price = price
    @tax_rate = tax
  end

  #reader
  def name
    @name
  end

  def base_price
    @base_price
  end

  def tax_rate
    @tax_rate
  end

  #instance method
  def total_price
    total = @base_price * (@tax_rate + 1)
    return total.round(2)
  end

end
