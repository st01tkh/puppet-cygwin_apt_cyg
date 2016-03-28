require 'Open3'
stdin, stdout, stderr = Open3.popen3('C:/Windows/System32/reg.exe query HKLM\Software\Cygwin\setup')
#stdout=`C:/Windows/System32/reg.exe`
if 
puts 'out: ' + stdout.gets

