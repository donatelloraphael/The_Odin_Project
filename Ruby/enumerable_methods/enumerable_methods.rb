module Enumerable
	def my_each
		return self.to_enum unless block_given?
		if self.class == Hash
			for k in self.keys do
				yield(k, self[k])
			end
		else
			i = 0
			while i < self.length do
				yield(self[i])
				i += 1		
			end
		end
		self		
	end

	def my_each_with_index
		return self.to_enum unless block_given?
		if self.class == Hash
			i = 0
			for k in self.keys do
				yield(k, self[k], i)
				i += 1
			end
		else
			i = 0
			while i < self.length do
				yield(self[i], i)
				i += 1
			end
		end
		self
	end

	def my_select
		return self.to_enum unless block_given?
		if self.class == Hash
			new_hash = {}
			self.my_each do |k, v|
				new_hash[k] = v if yield(k,v)
			end
			new_hash
		else
			new_array = []
			self.my_each do |x|
				new_array << x if yield(x)
			end
			new_array
		end
	end

	def my_all?
		return self.to_enum unless block_given?
		check = true
		if self.class == Hash
			self.my_each do |k, v|
				check = false if !yield(k, v)
			end
			check
		else
			self.my_each do |x|
				check = false if !yield(x)
			end
			check
		end
	end

	def my_any?
		return self.to_enum unless block_given?
		check = false
		if self.class == Hash
			self.my_each do |k, v|
				check = true if yield(k, v)
			end
			check
		else
			self.my_each do |x|
				check = true if yield(x)
			end
			check
		end
	end

	def my_none?
		return self.to_enum unless block_given?
		check = true
		if self.class == Hash
			self.my_each do |k, v|
				check = false if yield(k, v)
			end
			check
		else
			self.my_each do |x|
				check = false if yield(x)
			end
			check
		end
	end

	def my_count
		return self.length.to_enum unless block_given?
		count = 0
		if self.class == Hash
			self.my_each do |k, v|
				count += 1 if yield(k, v)
			end
			count
		else
			self.my_each do |x|
				count += 1 if yield(x)
			end
		end



end