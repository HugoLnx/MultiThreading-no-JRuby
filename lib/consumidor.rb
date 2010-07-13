module MultiThreading
	class Consumidor
		include Runnable
		
		def initialize(localizacao_compartilhada)
			@localizacao_compartilhada = localizacao_compartilhada
		end
		
		def run
			soma = 0
			10.times do
				begin
					JThread.sleep rand(3000)
					soma += @localizacao_compartilhada.get
				rescue InterruptedException => e
					e.print_stack_trace
				end
			end
			puts "Fim do Consumidor\n" +
			     "Valor da Soma: #{soma}"
		end
	end
end