require 'gosu'
require 'chingu'
include Gosu
include Chingu


module Graphics
	class << self
		def width
			return 640
		end
	
	
		def height
			return 480
		end
	end
end
class Main < Window
	def initialize
		super Graphics.width, Graphics.height, false
		str = 'Fire In URPGS: DDoS URPGS XD'
		self.caption = str
		push_game_state(Title)
	end
end

class Font
	def draw_center(text,y,z,color)
		a = Graphics.width/2 - self.text_width(text)/2
		draw(text,a,y,z,1,1,color,:default)
	end
end

class Title < GameState
	def initialize
		super
		self.input = {:released_space => :start_game}
	end
	
	
	def start_game
	end
	
	def update
		@star_timer+=1
		if @star_timer>=60
			@star_timer = 0
			create_a_star
		end
	end
	
	
	def create_a_star
		@stars << TitleStars.create
	end
	
	def draw
		
		$window.fill(Color::WHITE)
		@font = Font.new($window, 'Ubuntu',80)
		
		@font.draw_center('Fire in URPGS', 150, 0, Color::BLACK)
		Font.new($window,'Ubuntu',30).draw_center('Press Space to Begin',300,0,Color::BLACK)
		TitleStars.create
	end
	
	
	def setup
		@stars = []
		@star_timer = 0
	end
	
	def finalize
	end
end


class TitleStars < GameObject
	traits :sprite, :image => 'star.png'
end


Main.new.show
