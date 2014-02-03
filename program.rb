#!/usr/bin/env ruby2.1

require 'ogrenci'

class Program
	def initialize
		Ogrenci.new.yeni
	end
end

Program.new