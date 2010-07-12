module MultiThreading
	class BufferExemplo
		include Buffer
		
		def initialize
			@buffer = 0
		end
		
		def set(valor)
			puts "Produtor grava: #{valor}"
			@buffer = valor
		end
		
		def get
			puts "Consumidor lê: #{@buffer}"
			@buffer
		end
	end
end