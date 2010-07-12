require 'spec_helper'

module MultiThreading
	describe 'Buffer' do
		it 'deveria ter o metodo set' do
			Buffer.instance_method(:set).should_not be_nil
		end
		
		it 'deveria ter o metodo get' do
			Buffer.instance_method(:get).should_not be_nil
		end
	end
end