module MultiThreading
	class BufferBlocking
		include Buffer
		
		def initialize
			@buffer = ArrayBlockingQueue.new 3
		end
		
		def set(valor)
			begin
				@buffer.put(valor)
				puts "Produtor grava: #{valor}  Buffers Ocupados: #{@buffer.size}\n"
			rescue Exception => e
				puts e.backtrace
			end
		end
		
		def get
			begin
				valor_lido = @buffer.take
				puts "Consumidor le: #{valor_lido}  Buffers Ocupados: #{@buffer.size}\n"
			rescue Exception => e
				puts e.backtrace
			end
			valor_lido
		end
	end
end