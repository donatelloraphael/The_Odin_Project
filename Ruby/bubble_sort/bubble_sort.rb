def bubble_sort(array)
	array.length.times do
		i = 0
		while i < array.length - 1 do
			if array[i] > array[i + 1]
				temp = array[i]
				array[i] = array[i + 1]
				array[i + 1] = temp
			end
			i += 1
		end
	end
	return array
end
	

puts bubble_sort([4,3,78,2,0,2, 10, 12])
