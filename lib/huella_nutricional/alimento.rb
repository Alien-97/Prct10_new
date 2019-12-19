
# Clase Alimento que almacena información nutricional y de
# eficiencia  energética de un alimento.
#
# @author Alien Embarec Riadi
#
# @!attribute [rw] nombre_alimento
#   @return [String] nombre del alimento
# @!attribute [rw] kg_gei
#   @return [Float] kilogramos gases efecto invernadero
# @!attribute [rw] area_terreno
#   @return [Float] m² de terreno usados para elaborar el producto
# @!attribute [rw] proteinas
#   @return [Float] cantidad en gramos de proteinas
# @!attribute [rw] carbohidratos
#   @return [Float] cantidad en gramos de carbohidratos
# @!attribute [rw] lipidos
#   @return [Float] cantidad en gramos de lipidos
# @!attribute [rw] sexo
#   @return [String] sexo de la persona, hombre o mujer
# @!attribute [rw] cantidad_elemento
#   @return [Float] cantidad en gramos de gramos del alimento

class Alimento

	include Comparable
	
	attr_accessor :nombre_alimento,:kg_gei,:area_terreno,:proteinas,:carbohidratos,:lipidos,:sexo,:cantidad_elemento

	# Crear un alimento
	# @param nombre_alimento [String]
	# @param kg_gei [Float]
	# @param area_terreno [Float]
	# @param proteinas [Float]
	# @param carbohidratos [Float]
	# @param lipidos [Float]
	# @param sexo [String]
	# @param cantidad_elemento [Float]
	# @return [Alimento]

	def initialize(nombre_alimento,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo,cantidad_elemento)

		@nombre_alimento,@kg_gei,@area_terreno,@proteinas,@carbohidratos,@lipidos,@sexo,@cantidad_elemento= nombre_alimento,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo,cantidad_elemento			
	end

	# Devuelve el valor energetico del alimento
	
	# @return val_energetico_alimento [Float] el valor energetico del alimento en Kcal
	def valor_energetico_alimento
		@val_energetico_alimento = (((4 * @carbohidratos + 4 * @proteinas + 9 * @lipidos) * 100).round) / 100.0

		@val_energetico_alimento
	end

	# Multiplicar el alimento por un escalar
	#
	# @return [Alimento]

	def *(escalar)

		if escalar.is_a? Numeric
			Alimento.new(@nombre_alimento,@kg_gei* escalar,@area_terreno*escalar,@proteinas*escalar,@carbohidratos*escalar,@lipidos * escalar,@sexo,@cantidad_elemento *escalar)
		else
			raise ArgumentError, " Argumento pasado para multiplicar el objeto " + "#{@nombre_alimento} " + " no es un numero"
		end
	end

	# @deprecated Use {#to_s} instead of this method because
	#	ya no es necesario
	# 
	# @return usted_consume_bien [String,Float] la cantidad de proteinas que se debe consumir en base a si es hombre o mujer.
	def consumo_adecuado_proteinas

		cantidad_recomendada_proteinas_hombre = 54.0
		cantidad_recomendada_proteinas_mujer = 41.0
		cantidad_alimento_a_consumir = 0.0
		usted_consume_bien = " No se preocupe, con 100 g " + @nombre_alimento + " usted consume lo suficiente de proteinas "
		if @sexo === "hombre"
			if @proteinas < 54.0
				return cantidad_alimento_a_consumir = 100 * cantidad_recomendada_proteinas_hombre / @proteinas
			end
		elsif @sexo === "mujer"
			if @proteinas < 41.0
				return catidad_alimento_a_consumir = 100 * cantidad_recomendada_proteinas_mujer / @proteinas
			end
		end

		usted_consume_bien

	end

	# Método que imprime la salida(datos) del alimento formateada
	#
	# @return salida [String] los datos del alimento formateados

	def to_s
		salida = "#{ @cantidad_elemento.to_s + " "+"g" + " " +"de" + " " + @nombre_alimento + " los kg de gases de efecto invernadero que genera son: " + @kg_gei.to_s + " y la cantidad de terreno en metros cuadrados usado en producirlo son: " + @area_terreno.to_s + " Comer un kilo de " + @nombre_alimento + " te da " + @proteinas.to_s + " gramos de proteinas " + " y " + @carbohidratos.to_s + " gramos de carbohidratos " + " y " + @lipidos.to_s + " gramos de lipidos " + " Su valor energetico es: " + valor_energetico_alimento.to_s} "
	end


	# @deprecated Use{to_s} 
	#
	# @return salida [String] consumo adecuado proteinas

	def imprime_mensaje_recomendacion
		consumo_adecuado_proteinas.to_s
		gramos_a_consumir = " gramos de " + @nombre_alimento + " para llegar al minimo recomendado "
		if consumo_adecuado_proteinas.is_a?(String) == false
			consumo_adecuado_proteinas.to_s + " gramos de " + @nombre_alimento + " para llegar al minimo recomendado de proteinas "
		elsif consumo_adecuado_proteinas.is_a?(String) == true
			consumo_adecuado_proteinas
		end
	end

	# Sobrecarga del metodo <=> para comparar dos alimentos segun el valor energetico
	#
	# @param other [Alimento] alimento con el que se va a comparar
	# @return valor_energetico_alimento [true,false] el resultado de la comparacion

	def <=> (other)
		valor_energetico_alimento <=> other.valor_energetico_alimento
	end

	# Impacto ambiental del alimento
	# @param alimentos [Array] vector de alimentos para calcular el valor energetico
	# @return acc_gei [Float] kg de gases de efecto invernadero solo cuando el hombre o mujer consume la cantidad de calorías recomendada

	def impacto_ambiental(alimentos)
		acc = 0
		acc_kcal = 0
		acc_gei = 0
		acc_proteinas = 0
		prev_item = " "
		if alimentos.length >= 2
			alimentos.each do |alimento,indice|
				
				if indice.to_i >= 1
					if (alimento.sexo != prev_item)
						
						raise ArgumentError, "El menu lo debe consumir la misma persona, debe especificar el mismo genero en cada alimento"
					end
				end
				if alimento.instance_of?Alimento
					acc_kcal += alimento.valor_energetico_alimento
					acc_gei += alimento.kg_gei
					acc_proteinas += alimento.proteinas
					prev_item = alimento.sexo
				else
					raise ArgumentError, "Error: uno o mas  argumentos no son de tipo alimento "
				end
			end
		elsif alimentos.length < 2
			raise ArgumentError, "Numero de argumentos incorrecto, debe introducir 2 o más alimentos "
		end

		if (acc_proteinas < 54.0 || acc_kcal < 3000 ) && sexo === "hombre"
			raise RuntimeError, "No se puede calcular el GEI, cantidad de proteinas y/o calorias por debajo de la recomendada"
		elsif sexo === "mujer" && (acc_proteinas < 41 || acc_kcal < 2300)
			raise RuntimeError, "No se puede calcular el GEI, cantidad de proteinas y/o calorias por debajo de la recomendada"
		end
		return acc_gei
	
	end


end

