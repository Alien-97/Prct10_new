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
end
