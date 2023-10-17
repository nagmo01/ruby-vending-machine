class Suica
  def initialize
    @deposit = 500
  end


  def deposit
    @deposit
  end

  def charge=(deposit)
    if deposit > 100
      @deposit = deposit
    else
      puts "例外です"
    end
  end

  def deposit=(deposit)
    @deposit = deposit
  end

end


class Drink
  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end

  def name
    @name
  end
  
  def price
    @price
  end

  def stock
    @stock
  end

  def stock=(stock)
    @stock = stock
  end

end


class Machine

  def initialize
    drink1 = Drink.new("ペプシ", 150, 5)
    drink2 = Drink.new("モンスター", 230, 5)
    drink3 = Drink.new("いろはす", 120, 5)
    @sales = 0
    @drinks = [drink1, drink2, drink3]

  end

  def drink
    @drink
  end

  def sales
    @sales
  end
  
  def drinkList
    @drinks.each do |drink|
      p "#{drink.name},#{drink.stock}"
    end
  end


  def onSale
    list = []

    @drinks.each do |drink|
      if drink.stock > 0
        list.push(drink.name)
      end
    end
    return list
  end

  def getDrink(name)

    @drinks.each do |drink|
      if drink.name == name
        return drink
      end
    end
  end

  def buy(name,suica)
    drink = getDrink(name)
    if onSale.include?(name) and suica.deposit > drink.price
      drink.stock = drink.stock - 1
      suica.deposit = suica.deposit - drink.price
      @sales += drink.price
    else
      puts "例外"
    end
  end

  def chargeDrink(name, stock)
    @drinks.each do |drink|
      if drink.name == name
        drink.stock = drink.stock + stock
      end
    end
  end
end

suica = Suica.new
machine = Machine.new

machine.drinkList
machine.chargeDrink("ペプシ", 20)

machine.buy("いろはす", suica)

machine.buy("モンスター", suica)

machine.drinkList
puts machine.sales

