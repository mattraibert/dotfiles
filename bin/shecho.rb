def shecho(cmd, options = {:echo => true, :execute => true})
  puts "$ #{cmd}" if(options[:echo])
  `#{cmd}` if(options[:execute])
end
