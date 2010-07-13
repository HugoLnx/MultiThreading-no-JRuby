require 'spec_helper'

module MultiThreading
	describe 'Um BufferExemplo' do
		it 'deveria implementar Buffer' do
			BufferExemplo.should include Buffer
		end
		
		it 'deveria ser instanciavel' do
			lambda{BufferExemplo.new}.should_not raise_error
		end
		
		context 'apos ser instanciado' do
			before :all do
				@um_buffer = BufferExemplo.new
			end
			
			it 'deveria ter o atributo buffer' do
				@um_buffer.instance_variable_defined?(:@buffer).should be_true
			end
			
			it 'deveria ter o atributo lock_de_acesso' do
				@um_buffer.instance_variable_defined?(:@lock_de_acesso).should be_true
			end
			
			it 'deveria ter o atributo pode_gravar' do
				@um_buffer.instance_variable_defined?(:@pode_gravar).should be_true
			end
			
			it 'deveria ter o atributo pode_ler' do
				@um_buffer.instance_variable_defined?(:@pode_ler).should be_true
			end
			
			it 'deveria ter o atributo buffers_ocupados' do
				@um_buffer.instance_variable_defined?(:@buffers_ocupados).should be_true
			end
			
			it 'deveria ter o atributo gravar_indice' do
				@um_buffer.instance_variable_defined?(:@gravar_indice).should be_true
			end
			
			it 'deveria ter o atributo ler_indice' do
				@um_buffer.instance_variable_defined?(:@ler_indice).should be_true
			end
			context 'apos usar o metodo set passando 1 como parametro' do
				before :all do
					@um_buffer.set 1
				end
				
				it 'deveria ter 1 buffer ocupado' do
					atr_buffers_ocupados = @um_buffer.instance_variable_get :@buffers_ocupados
					atr_buffers_ocupados.should be_eql 1
				end
				
				it 'deveria ter o primeiro buffer igual a 1' do
					atr_buffer = @um_buffer.instance_variable_get :@buffer
					atr_buffer.first.should be_eql 1
				end
				
				it 'deveria ter o metodo get retornando 1' do
					@um_buffer.get.should be_eql 1
				end
				
			end
		end
	end
end