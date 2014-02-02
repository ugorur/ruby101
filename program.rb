#!/usr/bin/env ruby2.1

class DosyaHatalari < StandardError
end

class Dosya
	def ekle(dosya_adi, veriler, sifirla = false)
		File.open(dosya_adi, sifirla ? 'w' : 'a') do |dosya|
			dosya.puts(self.veriler(veriler))
		end
	end

	def oku (dosya_adi)
		hata("Dosya henuz olusturulmamis") unless varmi? dosya_adi

		File.open(dosya_adi) do |dosya|
			dosya.each do |satir|
				satir.split('||').map{ |veri| veri.split('=>').map{ |v| kurtar(v) } }.to_h unless satir.empty?
			end
		end
	end

	private 
	def veriler (veriler)
		buffer = []
		veriler.each do |anahtar, deger|
			buffer << hazirla(anahtar) + '=>' + hazirla(deger.to_s)
		end
		buffer.join('||')
	end

	def hazirla (veri)
		veri.to_s.tr('=>', '=\>').tr('||', '|\|')
	end

	def kurtar (veri)
		veri.tr('=\>', '=>').tr('|\|', '||')
	end

	def varmi? (dosya_adi)
		File.exist? dosya_adi
	end

	def hata (mesaj)
		raise DosyaHatalari, mesaj
	end
end

class Ogrenci < Dosya
	DOSYA = 'ogrenciler'

	def initialize
		@veriler = Hash.new
	end

	def yeni
		veri_al('Adi')
		veri_al('Soyadi')
		veri_al('Cep Numarasi')
		veri_al('E-Posta Adresi')
		self
	end

	def kaydet
		ekle(DOSYA, @veriler)
	end

	def listele
		oku(DOSYA).each do |ogrenci_bilgileri|
			veri_ver(ogrenci_bilgileri)
		end
	end

	def al (satir)
		puts oku.dosya(DOSYA)[satir]
	end

	def sil (satir)
		ekle(oku.dosya(DOSYA).delete_at(satir), true)
	end

	private

	def veri_al (veri_adi)
		print veri_adi + ': '
		@veriler[veri_adi] = gets.to_s.chomp
	end

	def veri_ver (bilgiler)
		bilgiler.each do |anahtar, deger|
			puts anahtar + ': ' + deger
		end
	end
end

class Program
	def initialize
		Ogrenci.new.yeni
	end
end

Program.new