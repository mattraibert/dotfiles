#!/usr/bin/env ruby
require 'fileutils'
require_relative './bin/shecho'

pwd = Dir.pwd
home = ENV['HOME']
dir = Dir.glob "*"
%w[bin emacs.d gitconfig gitignore zshrc gitattributes gemrc].each do |dotfile|
  sourcefile = "#{pwd}/#{dotfile}"
  destfile = "#{home}/.#{dotfile}"
  if dir.include? dotfile
    if !File.symlink? destfile
      shecho("mv #{destfile} #{destfile}.bak") if (File.exist? destfile)
      shecho("ln -sf #{sourcefile} #{destfile}")
    else
      puts "skipping existing link: #{destfile} -> #{File.readlink destfile}"
    end
  else
    puts "could not find #{dotfile}, run it from the dotfiles directory"
  end
end

