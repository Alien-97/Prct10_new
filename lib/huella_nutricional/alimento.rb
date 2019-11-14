class Alimento

	attr_accessor :nombre,:kg_gei,:area_terreno,:proteinas,:carbohidratos,:lipidos,:sexo

	def initialize(nombre,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo)
		@nombre,@kg_gei,@area_terreno,@proteinas,@carbohidratos,@lipidos,@sexo= nombre,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo			
	end

	def valor_energetico_alimento
		@val_energetico_alimento = (((4 * @carbohidratos + 9 * @proteinas + 4 * @lipidos) * 100).round) / 100.0
	end
end
