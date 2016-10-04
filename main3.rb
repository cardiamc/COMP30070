#!/usr/bin/env ruby

class Product
  attr_accessor :name
  def initialize(name, net_price, count)
    @name = name
    @net_price = net_price.to_f
    @count = count.to_i
  end
  def net_price
		@net_price
  end
  def gross_price
  	@net_price*1.20
  end
  def print_value
	puts "#{@name}  €#{gross_price}  €#{@count}"
  end
  def total_product
	@net_price*@count
  end
end

class Shop
	def initialize
		@n=0
		@j=0
		@products=[]
		@total=0
		@average=0
	end
	def add_product(name, net_price, count)
		@products[@n]=Product.new(name, net_price, count)
		@n=@n+1
	end
	def print_product
		for @j in 0..@n-1
			@products[@j].print_value
		end
	end
	def sort
		@products.sort! { |a,b| a.name <=> b.name }
	end
	def calculate_total
		for @j in 0..@n-1
			@total=@total+@products[@j].total_product
		end
		puts "Total value in the shop: €#{@total}"
	end
	def calculate_average
		for @j in 0..@n-1
			@average=@average+@products[@j].gross_price
		end
		@average=@average/(@n)
		puts "Average product price: €#{@average}"
	end
end

market=Shop.new
IO.foreach('shop.txt') do |line|
  data = line.split
  name = data[0]
  net_price = data[1].to_f
  count = data[2]
  market.add_product(name, net_price, count)
end

market.sort
market.print_product
market.calculate_total
market.calculate_average