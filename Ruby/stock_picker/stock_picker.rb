def stock_picker(array)
	highest_profit = 0
	i = 0
	while i < array.length - 1 do
		j = i + 1
		while j < array.length do
			profit = array[j] - array[i]
			if profit > highest_profit
				highest_profit = profit
				buy_date = i
				sell_date = j
			end
			j += 1
		end
		i += 1
	end 
	return [buy_date, sell_date] 
end

p stock_picker([17,3,6,9,15,8,6,1,10])