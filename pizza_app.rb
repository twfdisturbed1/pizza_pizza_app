def crust_subtotal(pizza_crust)
	crust_subtotal_arr = []
	crust = "#{pizza_crust}"
	if crust == "stuff crust" 
		crust_subtotal_arr << 2.00
	elsif crust == "cheese bites crust" 
	crust_subtotal_arr << 3.00
	else 
		crust_subtotal_arr << 0.00
	end
	crust_subtotal_arr
end

def toppings(pizza_toppings)
	p "pizza_toppings are #{pizza_toppings} and its class is #{pizza_toppings.class}"
	empty = []
	toppings_price = {"cheese" => 0.00, "pepperoni" => 0.50, "sausage" => 0.50, "ham" => 0.75, "bacon" => 0.75, "pineapple" => 1.00, "extra cheese" => 1.00, "green peppers" => 0.25, "banana peppers" => 0.25, "mushrooms" => 0.25, "olives" => 0.25, "onions" => 0.25, "grilledchicken" => 0.50, "meatball" => 0.75, "beef" => 0.75, "pork" => 0.75, "jalapeno" => 0.25, "none" => 0.00 }
	toppings_subtotal = 0.00
	eval(pizza_toppings).each  do |topping|
		toppings_subtotal = toppings_price.values_at(topping)
		empty << toppings_subtotal
		p "toppings at empty are #{empty} and its class is #{empty.class}"
	
	end
	empty
end
 

def size(pizza_size)
	size_array = []
	if pizza_size == "small"
		size_array << 5.00
	elsif pizza_size == "medium"
		size_array << 7.00
	else 
		size_array << 9.00
	end
	size_array
end



def subtotal_array(pizza_toppings, pizza_crust, pizza_size)
	new_array = []
	new_array = toppings(pizza_toppings) << crust_subtotal(pizza_crust) << size(pizza_size)
	puts "new_array is #{new_array} in subtotal_array"
	new_array.flatten
end


def delivery(delivery_option)
	delivery_arr = []
	charge = 0
	if delivery_option == "delivery"
		charge += 3.00
	else 
		charge = 0.00
	end
	delivery_arr << charge
end


def final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option, pizza_size)
	#p "toppings are #{pizza_toppings} and its class is #{pizza_toppings.class}"
	#p "delivery option is #{delivery_option}"
	#p "crust is #{pizza_crust}"
	#p "pizza size is #{size} and its class is #{size.class}"
	#p "pizza quatity is #{pizza_quantity}"
	final_hash = {}
	total_arr = []
	subtotal_arr = subtotal_array(pizza_toppings, pizza_crust, pizza_size)
	#p "subtotal_arr in total_arr is #{subtotal_arr}"
	total_arr = subtotal_arr * pizza_quantity.to_f
	total_arr << delivery(delivery_option)
	p "in final_total total_arr is #{total_arr} class is #{total_arr.class}"
	total = total_arr.flatten.sum
	final_hash["pizza_quantity"] = pizza_quantity
	final_hash["pizza_size"] = pizza_size
	final_hash["pizza_crust"] = pizza_crust
	final_hash["pizza_toppings"] = pizza_toppings
	final_hash["delivery_option"] = delivery_option
	final_hash["total"] = total
	final_hash
	#{}"#{total_arr + tax_and_delivery}"
	# p "I have your order as #{pizza_quantity} #{pizza_crust} pizza(s) with #{pizza_toppings} for #{delivery_option}.  Your total is $#{total}, with tax.  Thank you for your order!"
end
#p final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option)
#p "final total is #{final_total(pizza_toppings, pizza_crust, pizza_quantity, delivery_option)}"