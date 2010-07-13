aqui = File.dirname __FILE__
$LOAD_PATH << aqui

require 'java'

java_import java.lang.Runnable
java_import java.lang.InterruptedException
java_import java.util.concurrent.ExecutorService
java_import java.util.concurrent.Executors
java_import java.util.concurrent.locks.ReentrantLock
java_import java.util.concurrent.ArrayBlockingQueue
JThread = java.lang.Thread # A constante Thread ja existe

# Dando require de todas as classes do diretorio bin/
classes_requiridas = Dir[File.join(aqui,'**.class')]
classes_requiridas.delete_if{|path| path.include? 'multithreading.class'}
classes_requiridas.each do |class_arq|
	class_arq = class_arq.slice(/bin\/(.*)\.class$/,1)
	require File.basename class_arq
end