#!/usr/bin/env ruby2.1

require 'ogrenci'

class Program
	def initialize
		puts 'Programimiz iki parcadan olusuyor. Lutfen birini seciniz:'
		puts " 1) Siniflar"
		puts " 2) Ogrenciler"
		secim = gets.chomp.to_i

		ilk_secim (secim)
	end

	private
	def ilk_secim (secim)
		if secim == 1
			siniflar
		else
			ogrenciler
		end
	end
	def siniflar
		puts 'Yapmak istediginiz islem nedir:'
		puts " 1) Ekle"
		puts " 2) Listele"
		secim = gets.chomp.to_i

		sinif_secim (secim)
	end
	def sinif_secim (secim)
		if secim == 1
			Siniflar.new.yeni
		else
			Siniflar.new.listele
		end
	end
end

Program.new