#!/usr/bin/env ruby
require 'fileutils'
require_relative './bin/shecho'

pwd = Dir.pwd
home = ENV['HOME']
dir = Dir.glob "*"
['bin', 'emacs.d', 'gitconfig', 'gitignore', 'bashrc', 'bash_profile', 'aliases', 'gitattributes', 'gemrc'].each do |dotfile|
  sourcefile = "#{pwd}/#{dotfile}"
  destfile = "#{home}/.#{dotfile}"
  if dir.include? dotfile
    unless(File.symlink? destfile)
      shecho("mv #{destfile} #{destfile}.bak") if(File.exist? destfile)
      shecho("ln -sf #{sourcefile} #{destfile}")
    end
  else
    puts "could not find #{dotfile}, run it from the dotfiles directory"
  end
end

