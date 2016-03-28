#!/usr/bin/env ruby

require 'open3'

# Returns true if all files are EOF
#
def all_eof(files)
  files.find { |f| !f.eof }.nil?
end

command = "ls -l"

puts "Running command: #{command}"

BLOCK_SIZE = 1024

Open3.popen3(command) do |stdin, stdout, stderr|
  stdin.close_write

  begin
    files = [stdout, stderr]

    until all_eof(files) do
      ready = IO.select(files)

      if ready
        readable = ready[0]
        # writable = ready[1]
        # exceptions = ready[2]

        readable.each do |f|
          fileno = f.fileno

          begin
            data = f.read_nonblock(BLOCK_SIZE)

            # Do something with the data...
            puts "fileno: #{fileno}, data: #{data}"
          rescue EOFError => e
            puts "fileno: #{fileno} EOF"
          end
        end
      end
    end
  rescue IOError => e
    puts "IOError: #{e}"
  end
end

puts "Done"
