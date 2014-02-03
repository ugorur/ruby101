require './hata'

class Dosya
	def ekle(dosya_adi, veri, sifirla = false)
		File.open(dosya_adi, sifirla ? 'w' : 'a') do |dosya|
			dosya.puts(veriler(veri))
		end
	end

	def oku (dosya_adi)
		hata("Dosya henuz olusturulmamis") unless varmi? dosya_adi

		v = []

		File.open(dosya_adi) do |dosya|
			dosya.each do |satir|
				v << satir.split('||').map{ |veri| veri.split('=>').map{ |v| kurtar(v) } }.to_h unless satir.empty?
			end
		end

		v
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