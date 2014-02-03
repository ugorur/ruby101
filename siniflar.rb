require './dosya'

class Siniflar < Dosya
	DOSYA = 'siniflar'

	def initialize
		@veriler = Hash.new
	end

	def yeni
		veri_al('No')
		veri_al('Ders')
		veri_al('Ogrenci Sayisi')
		self
	end

	def kaydet
		ekle(DOSYA, @veriler)
	end

	def listele
		oku(DOSYA).each do |sinif_bilgileri|
			veri_ver(sinif_bilgileri)
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