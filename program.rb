#!/usr/bin/env ruby2.1

require './ogrenci'
require './siniflar'

class Program
	def initialize
		puts 'Lutfen birini seciniz:'
		puts " 1) Siniflar"
		puts " 2) Ogrenciler"
		ilk_secim (gets.chomp.to_i)
	end

	private
	def ilk_secim (s)
		if s == 1
			sinif_secim (secim())
		else
			ogrenci_secim (secim())
		end
	end
	def sinif_secim (s)
		if s == 1
			Siniflar.new.yeni.kaydet
		else
			Siniflar.new.listele
		end
	end
	def ogrenci_secim (s)
		if s == 1
			Ogrenci.new.yeni.kaydet
		else
			Ogrenci.new.listele
		end
	end
	def secim
		puts 'Yapmak istediginiz islem nedir:'
		puts " 1) Ekle"
		puts " 2) Listele"
		gets.chomp.to_i
	end
end

Program.new