require 'spec_helper'

module MultiThreading
	describe 'Um Produtor' do
		before :all do
			@buffer = BufferExemplo.new
		end
	
		it 'deveria implementar Runnable' do
			Produtor.should include Runnable
		end
	
		it 'deveria ser instanciavel' do
			lambda{Produtor.new @buffer}.should_not raise_error
		end
		
		context 'apos ser instanciado' do
			before :all do
				@produtor = Produtor.new @buffer
			end
			
			it 'deveria ter uma localizacao compartilhada' do
				localizacao_compartilhada = @produtor.instance_variable_get :@localizacao_compartilhada
				localizacao_compartilhada.should_not be_nil
			end
			
			it 'deveria ser executavel' do
				@produtor.method(:run).should_not be_nil
			end
		end
	end
end