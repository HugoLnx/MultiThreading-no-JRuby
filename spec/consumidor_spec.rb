require 'spec_helper'

module MultiThreading
	UmBuffer = Class.new{include Buffer}
	
	describe 'Um Consumidor' do
		before :all do
			@buffer = UmBuffer.new
		end
	
		it 'deveria implementar Runnable' do
			Consumidor.should include Runnable
		end
	
		it 'deveria ser instanciavel' do
			lambda{Consumidor.new @buffer}.should_not raise_error
		end
		
		context 'apos ser instanciado' do
			before :all do
				@consumidor = Consumidor.new @buffer
			end
			
			it 'deveria ter uma localizacao compartilhada' do
				localizacao_compartilhada = @consumidor.instance_variable_get :@localizacao_compartilhada
				localizacao_compartilhada.should_not be_nil
			end
			
			it 'deveria ser executavel' do
				@consumidor.method(:run).should_not be_nil
			end
		end
	end
end