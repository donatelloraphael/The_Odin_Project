def bubble_sort_by(array)
	array.length.times do
		i = 0
		swap = 0
		while i < array.length - 1 do
			if block_given?
				swap_case = yield(array[i], array[i + 1])
			else 
				swap_case = array[i] > array[i + 1]
			end
			if swap_case > 0
				temp = array[i]
				array[i] = array[i + 1]
				array[i + 1] = temp
				swap += 1
			end
			i += 1
		end
		break if swap == 0
	end
	return array
end
	
puts bubble_sort_by(["hi","hello","hey","together","weed"]) { |left,right| left.length - right.length }