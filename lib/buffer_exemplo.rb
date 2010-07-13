module MultiThreading
	class BufferExemplo
		include Buffer
		
		def initialize
			@buffer = -1
			@lock_de_acesso = ReentrantLock.new
			@pode_gravar = @lock_de_acesso.new_condition
			@pode_ler = @lock_de_acesso.new_condition
			@ocupado = false
		end
		
		def set(valor)
			@lock_de_acesso.lock
			begin
				while @ocupado
					puts 'Produtor tenta gravar'
					mostrar_estado 'Buffer Cheio. Produtor Aguarda'
					@pode_gravar.await
				end
				@buffer = valor
				@ocupado = true
				mostrar_estado "Produtor grava: #{@buffer}"
				@pode_ler.signal
			rescue InterruptedException => e
				e.print_stack_trace
			ensure
				@lock_de_acesso.unlock
			end
		end
		
		def get
			valor_lido = 0
			@lock_de_acesso.lock
			begin
				while !@ocupado
					puts 'Consumidor tenta ler'
					mostrar_estado 'Buffer vazio. Consumidor Aguarda'
					@pode_ler.await
				end
				@ocupado = false
				valor_lido = @buffer
				mostrar_estado "Consumidor le: #{valor_lido}"
				@pode_gravar.signal
			rescue InterruptedException => e
				e.print_stack_trace
			ensure
				@lock_de_acesso.unlock
			end
			valor_lido
		end
		
		def mostrar_estado(operacao)
			puts "#{operacao}   #{@buffer}   #{@ocupado}"
		end
	end
end