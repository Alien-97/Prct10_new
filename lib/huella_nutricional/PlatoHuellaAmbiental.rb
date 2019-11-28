require '/home/alien/Escritorio/INGENIERÍA_INFORMÁTICA/CUARTO/TERCERO/LPP/Prácticas/Prct8/tdd-Alien-97/lib/huella_nutricional/alimento.rb'
require '/home/alien/Escritorio/INGENIERÍA_INFORMÁTICA/CUARTO/TERCERO/LPP/Prácticas/Prct8/tdd-Alien-97/lib/huella_nutricional/lista.rb'
require '/home/alien/Escritorio/INGENIERÍA_INFORMÁTICA/CUARTO/TERCERO/LPP/Prácticas/Prct8/tdd-Alien-97/lib/huella_nutricional/PlatoHuellaNutricional.rb'
class PlatoHuellaAmbiental < PlatoHuellaNutricional

	
	def initialize(nombre,lista_alimentos,acc_cantidad_alimentos)
		super(nombre,lista_alimentos,acc_cantidad_alimentos)
		@emisiones_gei = 0
		@area_terreno_m2 = 0
	end

	def emisiones_gei

		if @emisiones_gei == 0

			@lista_alimentos.each do |alimento|

				@emisiones_gei += alimento.kg_gei
			end

			@emisiones_gei = @emisiones_gei.round(2)
		end


		@emisiones_gei
	end


	def area_terreno

		if @area_terreno_m2 == 0

			@lista_alimentos.each do |alimento|

				@area_terreno_m2 += alimento.area_terreno
			end

			@area_terreno_m2 = @area_terreno_m2.round(2)
		end

		@area_terreno_m2
	end


end
