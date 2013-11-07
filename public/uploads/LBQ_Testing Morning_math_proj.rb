NUMBERS = [0.004692,0.003986,0.007338,0.004562,0.003922]
WIDTH   = 0.025 # the width of the candy
DEGREE = 48 # The measured degree
VERTICAL_HEIGHT = 0.34 # The vertical height


def average
	nums	 = NUMBERS
	return nums.inject{ |sum, el| sum + el }.to_f / nums.size
end


def theta
	return 90 - DEGREE
end


def width
	return WIDTH
end

def s
	return width/average
end

alias :angle :theta


def radian
	return (angle * Math::PI)/180.0
end

def horizontal_speed
	return s * Math.cos(radian)
end


def vertical_speed
	return s * Math.sin(radian)
end

def vertical_height
	VERTICAL_HEIGHT
end


def formula
	return "0 = -4.9t**2 + #{vertical_speed}t + #{vertical_height}"
end



def solve_result
	a = -4.9
	b = vertical_speed
	c = vertical_height
	
	result = (-b - (b**2-4*a*c)**0.5 )/(2*a)
end


def range
	return solve_result * horizontal_speed
end

puts "Average Time #{average} sec"
puts "Speed: #{s} m/sec"
puts "Vertical Speed: #{vertical_speed} m/sec"
puts "Horizontal Speed: #{horizontal_speed} m/sec"
puts "FORMULA: #{formula}"
puts "Time: #{solve_result} sec"
puts "RANGE: #{range} m"
