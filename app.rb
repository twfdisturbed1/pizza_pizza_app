require 'sinatra'
require_relative 'pizza_app.rb'

enable :sessions

get '/' do
	
	erb :options

end

get '/options' do

	erb :options

end

get '/favpizza' do

	erb:favpizza

end
  
get '/favpizza2' do
  
	erb:favpizza2

end


get '/total' do
		
	erb :total

end
  
get '/favpizza3' do
  
	erb:favpizza3
  
end
p
post '/pizza_options' do
	delivery_option = params[:delivery_option]
	pizza_size  = params[:pizza_size]
	pizza_quantity = params[:how_many]
	pizza_crust = params[:crust_type]
	address_form = params[:address_form]
	sauce_type = params[:sauce_type]
	city = params[:city]
	zip = params[:zip]
	state = params[:state]
	user_name = params[:user_name]
	promocode = params[:promocode]
	pizza_toppings = params[:toppings].to_s
	p "params in pizza options are #{params}"
	redirect '/confirm_page?delivery_option=' + delivery_option + '&pizza_size=' + pizza_size + '&pizza_quantity=' + pizza_quantity + '&pizza_crust=' + pizza_crust + '&pizza_toppings=' + pizza_toppings + '&address_form=' + address_form + '&city=' + city + '&state=' + state + '&zip=' + zip + '&user_name=' + user_name + '&sauce_type=' + sauce_type
end

get '/confirm_page' do
	p "params in cofirm page get #{params}"
	p "params address form is #{params[:address_form]}"
	total = final_total(params[:pizza_toppings], params[:pizza_crust], params[:pizza_quantity], params[:delivery_option], params[:pizza_size])
	p_quantity = total.values[0]
	p_size = total.values[1]
	p_crust = total.values[2]
	p_toppings = total.values[3]
	toppings = eval(p_toppings)
	p "p_toppings is #{p_toppings} and its class is #{p_toppings.class}"
	p_delivery = total.values[4]
	session[:p_total] = total.values[5]
			session[:promocode] = params[:promocode]
			session[:user_name] = params[:user_name]
			session[:address_form] = params[:address_form]
			session[:city] = params[:city]
			session[:zip] = params[:zip]
			session[:state] = params[:state]
			session[:sauce_type] = params[:sauce_type]
			p "p_total params are #{session[:p_total]}"
	confirm_name = session[:user_name]
	confirm_sauce_type = session[:sauce_type]
		erb :confirm, locals:{total: total, p_quantity: p_quantity, p_size: p_size, p_crust: p_crust, toppings: toppings, p_delivery: p_delivery, confirm_name: confirm_name, confirm_sauce_type: confirm_sauce_type} 
end

post '/confirm_page' do
	confirm_quantity = params[:confirm_quantity]
	confirm_size = params[:confirm_size]
	confirm_crust = params[:confirm_crust]
	confirm_topping = params[:confirm_topping]
	confirm_delivery = params[:confirm_delivery]
	confirm_sauce_type = params[:confirm_sauce_type]
	#p_total = params[:p_total]
	p "confirm_quantity is #{confirm_quantity} and its class is #{confirm_quantity.class}"
	confirm_arr = []
	confirm_arr << confirm_quantity << confirm_size << confirm_crust << confirm_topping << confirm_delivery << confirm_sauce_type
	confirm_arr.uniq!
	p "confirm arr is #{confirm_arr} and its class is #{confirm_arr.class}"
	confirm_arr.each do |confirmation|
		if confirm_arr.length == 2
			redirect '/pizza_options'
		else confirm_arr.length == 1
			if confirmation == "no"
				redirect '/pizza_options'
			else
				redirect '/total_page'
			end
		end
	end
end	

get '/pizza_options' do
	erb :options
end

get '/total_page' do
	p "params in total page get are #{session[:p_total]}"
	p_total = session[:p_total]
	displayaddress = session[:address_form]
	displaycity = session[:city] 
	displayzip = session[:zip]
	displaystate = session[:state]
	displayname = session[:user_name]
	displaypromo = session[:promocode]
	erb :total, locals:{p_total: p_total, displaycity: displaycity, displaystate: displaystate, displayzip: displayzip, displayaddress: displayaddress, displayname: displayname}
end

post '/total_page' do

	redirect '/total'
end