def shecho(cmd, options = {:echo => false, :execute => true})
  puts "$ #{cmd}" if(options[:echo])
  `#{cmd}` if(options[:execute])
end
