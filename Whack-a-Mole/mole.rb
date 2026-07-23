require 'gosu'

class WhackaMole < Gosu::Window
	def initialize
		super(800, 600)
		self.caption ="Whack a Mole"
	end

end

Window = WhackaMole
Window.show_exceptions

