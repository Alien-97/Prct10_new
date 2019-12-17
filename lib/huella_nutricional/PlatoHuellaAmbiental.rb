
# Clase Plato que calcula la eficiencia energetica del 
# plato
#
# @author Alien Embarec Riadi
#


class PlatoHuellaAmbiental < PlatoHuellaNutricional

	include Comparable
	

	# Crear un plato (eficiencia energetica)
	#
	# @return [PlatoHuellaAmbiental]
	def initialize(nombre,lista_alimentos,acc_cantidad_alimentos)
		super(nombre,lista_alimentos,acc_cantidad_alimentos)
		@emisiones_gei = 0
		@area_terreno_m2 = 0
	end

	# Calcular las emisiones de gases de efecto invernadero del plato
	#
	# @return @emisiones_gei [Float] emisiones de gases de efecto invernadero del plato
	def emisiones_gei

		if @emisiones_gei == 0

			@lista_alimentos.each do |alimento|

				@emisiones_gei += alimento.kg_gei
			end

			@emisiones_gei = @emisiones_gei.round(2)
		end


		@emisiones_gei
	end

	# Calcular el area de terreno usada en metros cuadrados
	#
	# @return @area_terreno_m2 [Float] area de terreno usada en metros cuadrados

	def area_terreno

		if @area_terreno_m2 == 0

			@lista_alimentos.each do |alimento|

				@area_terreno_m2 += alimento.area_terreno
			end

			@area_terreno_m2 = @area_terreno_m2.round(2)
		end

		@area_terreno_m2
	end

	# (see #to_s)
	#
	# Llama al metodo to_s de la clase padre
	alias parent_to_s to_s

	# Mostrar la salida de la clase formateada
	#
	# @return @s [String] la salida de la clase formateada en un String

	def to_s
		s = ""
		
        s += super + "\n\n"

        s += "Emisiones de gases en kg CO2 " + emisiones_gei.to_s + "\n"

        s+= "Cantidad de terreno empleado en m2 " + area_terreno.to_s + "\n"
	end


	# Comparar dos platos segun la huella_nutricional
	# @param other [PlatoHuellaAmbiental] plato con el que se va a comparar
	# @return  [true,false] el resultado de la comparación

	def <=> (other)
		if other.is_a? PlatoHuellaNutricional
    		huella_nutricional_plato <=> other.huella_nutricional_plato
    	end
	end

	# indice de impacto de la energia del plato
	# 
	# @return  @ii_energia_plato [Integer] el resultado de la comparación

	def indice_impacto_energia_plato

		range = [670,830]

		ii_energia_plato = 0

		ii_energia_plato += lista_alimentos.select{ |i| i.valor_energetico_alimento <= 670}.inject(0) { |sum,element| sum  += 1 }

		ii_energia_plato += lista_alimentos.select{ |i| i.valor_energetico_alimento > 670 && i.valor_energetico_alimento <= 830}.inject(0) { |sum,element| sum += 2 }

		ii_energia_plato += lista_alimentos.select{|i| i.valor_energetico_alimento > 830}.inject(0) { |sum,element| sum += 3 }

		ii_energia_plato = (ii_energia_plato / lista_alimentos.size).round

	end

	# indice de impacto de la huella de carbono del plato
	# 
	# @return  @ii_huella_carbono_plato [Integer] el resultado de la comparación

	def indice_impacto_huella_carbono_plato

		range = [670,830]

		ii_huella_carbono_plato = 0

		ii_huella_carbono_plato += lista_alimentos.select{ |i| i.kg_gei*1000 <= 800}.inject(0) { |sum,element| sum  += 1 }

		ii_huella_carbono_plato += lista_alimentos.select{ |i| i.kg_gei*1000 > 800 && i.kg_gei*1000 <= 1200}.inject(0) { |sum,element| sum += 2 }

		ii_huella_carbono_plato += lista_alimentos.select{ |i| i.kg_gei*1000 > 1200}.inject(0) { |sum,element| sum += 3 }

		ii_huella_carbono_plato = (ii_huella_carbono_plato / lista_alimentos.size).round

	end	

	# indice de impacto de la huella nutricional del plato
	# 
	# @return  @hn_plato [Integer] la huella nutricional del plato

	def huella_nutricional_plato

		hn_plato = ((indice_impacto_energia_plato + indice_impacto_huella_carbono_plato) / 2).round

	end

end

#ejemplos para probar el correcto funcionamiento de la clase

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