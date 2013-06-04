def shecho(cmd, echo_mode = "echo and execute")
  puts "$ #{cmd}" if(/echo/ =~ echo_mode)
  `#{cmd}` if(/execute/ =~ echo_mode)
end
