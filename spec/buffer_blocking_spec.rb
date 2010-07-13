require 'spec_helper'

module MultiThreading
	describe 'Um BufferBlocking' do
		it 'deveria implementar Buffer' do
			BufferBlocking.should include Buffer
		end
		
		it 'deveria ser instanciavel' do
			lambda{BufferBlocking.new}.should_not raise_error
		end
		
		context 'apos ser instanciado' do
			before :all do
				@um_buffer = BufferBlocking.new
			end
			
			it 'deveria ter o atributo buffer' do
				@um_buffer.instance_variable_defined?(:@buffer).should be_true
			end
		end
	end
end