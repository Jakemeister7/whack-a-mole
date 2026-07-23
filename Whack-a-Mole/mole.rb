require 'gosu'

class WhackaMole < Gosu::Window
	def initialize
		super(800, 600)
		self.caption ="Whack a Mole"
		@image = Gosu::Image.new('images/mole.png')
		@x = 200
		@y = 200

	end

	def draw
		@image.draw(@x, @y, 1)
	end
end

Window = WhackaMole.new
Window.show

