require 'gosu'

class WhackaMole < Gosu::Window
	def initialize
		super(800, 600)
		self.caption ="Whack a Mole"
		@image = Gosu::Image.new('images/mole.png')
		@x = 200
		@y = 200
		@width = 100
		@height = 75
		@velocity_x = 2
		@velocity_y = 2
		@visible = 100
		@hammer = Gosu::Image.new('images/hammer.png')
		@hit = 0
		@font = Gosu::Font.new(30)
		@score = 0
	end

	def draw
		if @visible > 0
		@image.draw(@x - @width /2, @y - @height / 2, 1)
		end
		
		if @hit == 0
			c = Gosu::Color::NONE
		elsif @hit == 1
			c = Gosu::Color::GREEN
		elsif @hit == -1
			c = Gosu::Color::RED			
		end
		draw_quad(0, 0, c, 800, 0, c, 800, 600, c, 0, 600, c)
		@hammer.draw(mouse_x - 25, mouse_y - 39, 1)
		@hit = 0
		@font.draw(@score.to_s, 650, 50, 2)
	end

	def update
		@x += @velocity_x
		@y += @velocity_y
		@velocity_x *= -1 if @x + @width /2 > 800 || @x - @width /2 < 0
		@velocity_y *= -1 if @y + @height / 2 > 600 || @y - @height /2 < 0
		@visible -= 1
		@visible = 100 if @visible < -10 && rand < 0.01

	end

	def button_down(id)
		if (id == Gosu::MsLeft)
			if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50 && @visible >= 0
				@hit = 1
				@score += 10
			else
				@hit = -1
				@score -= 3
			end
		end
	end
end

Window = WhackaMole.new
Window.show

