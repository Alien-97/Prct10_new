=begin
require '/home/alien/Escritorio/INGENIERÍA_INFORMÁTICA/CUARTO/TERCERO/LPP/Prácticas/Prct8/tdd-Alien-97/lib/huella_nutricional/alimento.rb'
require '/home/alien/Escritorio/INGENIERÍA_INFORMÁTICA/CUARTO/TERCERO/LPP/Prácticas/Prct8/tdd-Alien-97/lib/huella_nutricional/lista.rb'
require '/home/alien/Escritorio/INGENIERÍA_INFORMÁTICA/CUARTO/TERCERO/LPP/Prácticas/Prct8/tdd-Alien-97/lib/huella_nutricional/PlatoHuellaNutricional.rb'
=end
class PlatoHuellaAmbiental < PlatoHuellaNutricional

	include Comparable
	
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

	alias parent_to_s to_s


	def to_s
		s = ""
		
        s += super + "\n\n"

        s += "Emisiones de gases en kg CO2 " + emisiones_gei.to_s + "\n"

        s+= "Cantidad de terreno empleado en m2 " + area_terreno.to_s + "\n"
	end

	def <=> (other)
		if other.is_a? PlatoHuellaNutricional
    		emisiones_gei <=> other.emisiones_gei
    	end
	end

	def indice_impacto_energia_plato

		range = [670,830]

		ii_energia_plato = 0

		ii_energia_plato += lista_alimentos.select{ |i| i.valor_energetico_alimento <= 670}.inject(0) { |sum,element| sum  += 1 }

		ii_energia_plato += lista_alimentos.select{ |i| i.valor_energetico_alimento > 670 && i.valor_energetico_alimento <= 830}.inject(0) { |sum,element| sum += 2 }

		ii_energia_plato += lista_alimentos.select{|i| i.valor_energetico_alimento > 830}.inject(0) { |sum,element| sum += 3 }

	end

	def indice_impacto_huella_carbono_plato

		range = [670,830]

		ii_huella_carbono_plato = 0

		ii_huella_carbono_plato += lista_alimentos.select{ |i| i.kg_gei*1000 <= 670}.inject(0) { |sum,element| sum  += 1 }

		ii_huella_carbono_plato += lista_alimentos.select{ |i| i.kg_gei*1000 > 670 && i.kg_gei*1000 <= 830}.inject(0) { |sum,element| sum += 2 }

		ii_huella_carbono_plato += lista_alimentos.select{ |i| i.kg_gei*1000 > 830}.inject(0) { |sum,element| sum += 3 }

	end	



end

@carne_vaca = Alimento.new("carne de vaca",50.0,164.0,21.1,0.0,3.1,"hombre",100)
@huevos = Alimento.new("huevos",4.2,5.7,13.0,1.1,11.0,"hombre",100)
@lentejas = Alimento.new("lentejas",0.4,3.4,23.5,52.0,1.4,"hombre",100)

@nodo_carne_vaca = Nodo.new(@carne_vaca,nil,nil)
@nodo_huevos = Nodo.new(@huevos,nil,nil)
@nodo_lentejas = Nodo.new(@lentejas,nil,nil)

@lista_alimentos_plato = Lista.new

@lista_alimentos_plato.push_tail(@nodo_carne_vaca)
@lista_alimentos_plato.push_tail(@nodo_huevos)
@lista_alimentos_plato.push_tail(@nodo_lentejas)

@acc_cantidad_alimentos = 0


@plato_tradicional_huella_ambiental = PlatoHuellaAmbiental.new("plato tradicional",@lista_alimentos_plato,@acc_cantidad_alimentos)

puts @plato_tradicional_huella_ambiental.to_s