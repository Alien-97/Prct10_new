class Alimento

	attr_accessor :nombre_alimento,:kg_gei,:area_terreno,:proteinas,:carbohidratos,:lipidos,:sexo,:cantidad_elemento

	def initialize(nombre_alimento,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo,cantidad_elemento)
		@nombre_alimento,@kg_gei,@area_terreno,@proteinas,@carbohidratos,@lipidos,@sexo,@cantidad_elemento= nombre_alimento,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo,cantidad_elemento			
	end

	def valor_energetico_alimento
		@val_energetico_alimento = (((4 * @carbohidratos + 9 * @proteinas + 4 * @lipidos) * 100).round) / 100.0
	end

	def consumo_adecuado_proteinas

	end
end
