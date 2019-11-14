class Alimento

	attr_accessor :nombre,:kg_gei,:area_terreno,:proteinas,:carbohidratos,:lipidos

	def initialize(nombre,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo)
		@nombre,@kg_gei,@area_terreno,@proteinas,@lipidos= nombre,kg_gei,area_terreno,proteinas,carbohidratos,lipidos			
	end
end
