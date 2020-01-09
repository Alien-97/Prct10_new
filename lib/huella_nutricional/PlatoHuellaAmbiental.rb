
# Clase Plato que calcula la eficiencia energetica del 
# plato
#
# @author Alien Embarec Riadi
#


class PlatoHuellaAmbiental < PlatoHuellaNutricional

	include Comparable
	

	# Crear un plato (eficiencia energetica)
	# @param nombre [String]
	# @param lista_alimentos [Lista]
	# @param acc_cantidad_alimentos [Float]
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
	# llama al metodo to_s de la clase padre
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

	# indice de impacto de la huella nutricional del plato
	# 
	# @return  @hn_plato [Integer] la huella nutricional del plato

	def huella_nutricional_plato

		energia_plato = valor_calorico_total

		ii_energia_plato = 0
		range_energia = [670,830]

		if energia_plato <= range_energia.first
			ii_energia_plato = 1
		elsif energia_plato > range_energia.first && energia_plato <= range_energia.last
			ii_energia_plato = 2
		elsif energia_plato > range_energia.last
			ii_energia_plato = 3
		end

		gei_plato = emisiones_gei

		ii_gei_plato = 0

		range_gei = [800,1200]

		if gei_plato <= range_gei.first
			ii_gei_plato = 1
		elsif gei_plato > range_gei.first && gei_plato <= range_gei.last
			ii_gei_plato = 2
		elsif gei_plato > range_gei.last
			ii_gei_plato = 3
		end
			
		hn_plato = ((ii_gei_plato + ii_energia_plato) / 2).round

	end

end

#ejemplos para probar el correcto funcionamiento de la clase

=begin
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

=end