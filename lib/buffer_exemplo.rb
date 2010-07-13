module MultiThreading
	class BufferExemplo
		include Buffer
		
		def initialize
			@buffer = [-1,-1,-1]
			@lock_de_acesso = ReentrantLock.new
			@pode_gravar = @lock_de_acesso.new_condition
			@pode_ler = @lock_de_acesso.new_condition
			@buffers_ocupados = 0
			@gravar_indice = 0
			@ler_indice = 0
		end
		
		def set(valor)
			@lock_de_acesso.lock
			begin
				while @buffers_ocupados == @buffer.size
					puts 'Todos os buffers cheios. Produtor aguarda'
					@pode_gravar.await
				end
				@buffer[@gravar_indice] = valor
				@gravar_indice = (@gravar_indice + 1) % @buffer.size
				@buffers_ocupados += 1
				mostrar_estado "Produtor grava: #{valor}"
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
				while @buffers_ocupados == 0
					puts 'Todos os buffers estao vazios. Consumidor Aguarda'
					@pode_ler.await
				end
				@buffers_ocupados -= 1
				valor_lido = @buffer[@ler_indice]
				@ler_indice = (@ler_indice + 1) % @buffer.size
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
			puts "#{operacao}   Buffers Ocupados: #{@buffers_ocupados}"
		end
	end
end