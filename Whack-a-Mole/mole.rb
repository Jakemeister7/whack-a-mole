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
		@velocity_x = 3
		@velocity_y = 3
		@visible = 0
	end

	def draw
		if @visible > 0
		@image.draw(@x - @width /2, @y - @height / 2, 1)
		end

	end

	def update
		@x += @velocity_x
		@y += @velocity_y
		@velocity_x *= -1 if @x + @width /2 > 800 || @x - @width /2 < 0
		@velocity_y *= -1 if @y + @height / 2 > 600 || @y - @height /2 < 0
		@visible -= 10
		@visible = 100 if @visible < -10 && rand < 0.01

	end

end

Window = WhackaMole.new
Window.show

