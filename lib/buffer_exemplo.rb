module MultiThreading
	class BufferExemplo
		include Buffer
		
		def initialize
			@buffer = -1
		end
		
		def set(valor)
			puts "Produtor grava: #{valor}"
			@buffer = valor
		end
		
		def get
			puts "Consumidor le: #{@buffer}"
			@buffer
		end
	end
end