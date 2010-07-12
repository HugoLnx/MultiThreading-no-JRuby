module MultiThreading
	class Produtor
		include Runnable
		
		def initialize(localizacao_compartilhada)
			@localizacao_compartilhada = localizacao_compartilhada
		end
		
		def run
			(1..10).each do |contador|
				begin
					JThread.sleep rand(3000)
					@localizacao_compartilhada.set contador
				rescue InterruptedException => e
					e.print_stack_trace
				end
			end
			puts "Produtor produz!!!\n" +
			     "Fim do Produtor"
		end
	end
end