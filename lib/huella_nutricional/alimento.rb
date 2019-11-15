class Alimento

	attr_accessor :nombre_alimento,:kg_gei,:area_terreno,:proteinas,:carbohidratos,:lipidos,:sexo,:cantidad_elemento

	def initialize(nombre_alimento,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo,cantidad_elemento)
		@nombre_alimento,@kg_gei,@area_terreno,@proteinas,@carbohidratos,@lipidos,@sexo,@cantidad_elemento= nombre_alimento,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo,cantidad_elemento			
	end

	def valor_energetico_alimento
		@val_energetico_alimento = (((4 * @carbohidratos + 9 * @proteinas + 4 * @lipidos) * 100).round) / 100.0
	end

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

	def to_s
		salida = "#{ "100 g de " + @nombre_alimento + " los kg de gases de efecto invernadero que genera son: " + @kg_gei.to_s + " y la cantidad de terreno en metros cuadrados usado en producirlo son: " + @area_terreno.to_s + " Comer un kilo de " + @nombre_alimento + " te da " + @proteinas.to_s + " gramos de proteinas " + " y " + @carbohidratos.to_s + " gramos de carbohidratos " + " y " + @lipidos.to_s + " gramos de lipidos " + " Su valor energetico es: " + valor_energetico_alimento.to_s} "
	end

	def imprime_mensaje_recomendacion
		consumo_adecuado_proteinas.to_s
		gramos_a_consumir = " gramos de " + @nombre_alimento + " para llegar al minimo recomendado "
		if consumo_adecuado_proteinas.is_a?(String) == false
			consumo_adecuado_proteinas.to_s + " gramos de " + @nombre_alimento + " para llegar al minimo recomendado de proteinas "
		elsif consumo_adecuado_proteinas.is_a?(String) == true
			consumo_adecuado_proteinas
		end
	end

	def impacto_ambiental(alimentos)
	
	end


end
