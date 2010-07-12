aqui = File.dirname __FILE__
$LOAD_PATH << aqui

require 'java'

java_import java.lang.Runnable
java_import java.lang.InterruptedException

JThread = java.lang.Thread

Dir[File.join(aqui,'**.class')].each do |class_arq|
	class_arq = class_arq.slice(/bin\/(.*)\.class$/,1)
	require File.basename class_arq
end