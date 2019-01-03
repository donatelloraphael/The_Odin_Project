def bubble_sort_by(array)
	array.length.times do
		i = 0
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
			end
			i += 1
		end
	end
	return array
end
	
puts bubble_sort_by(["hi","hello","hey","together","weed"]) { |left,right| left.length - right.length }