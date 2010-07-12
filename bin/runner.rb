aqui = File.dirname __FILE__
require File.join(aqui,'classes/multithreading')

teste = Executors.new_fixed_thread_pool 2

localizacao_compartilhada = MultiThreading::BufferExemplo.new

begin
	teste.execute MultiThreading::Produtor.new(localizacao_compartilhada)
	teste.execute MultiThreading::Consumidor.new(localizacao_compartilhada)
rescue Exception => e
	puts e.backtrace
end
teste.shutdown
