require './dosya'

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
		veri_al('Sinifi')
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