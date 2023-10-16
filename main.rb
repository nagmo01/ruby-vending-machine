class Suica
  def initialize
    @deposit = 500
  end


  def deposit
    @deposit
  end

  def charge=(deposit)
    if deposit > 100
      @deposit += deposit
    else
      puts "例外です"
    end
  end

  def deposit=(deposit)
    @deposit = deposit
  end

end



class Drink
  def initialize(name, price)
    @name = name
    @price = price
  end

  def name
    @name
  end
  
  def price
    @price
  end


end

class Machine

  def initialize
    @drink = Drink.new("ペプシ", 150)
    @stock = 5
    @sales = 0
  end

  def drink
    @drink
  end

  def stock
    @stock
  end

  def sales
    @sales
  end

  def purchase(suica)
    if @stock > 0 && suica.deposit > @drink.price
      puts suica.deposit
      puts @drink.price
      @stock -= 1
      puts @stock
      @sales += @drink.price
      puts @sales
      suica.deposit -= @drink.price
      puts suica.deposit
      puts "購入しました"
    else
      puts "例外"
    end
  end
end


suica = Suica.new
machine = Machine.new

zsh:1: command not found: :w
