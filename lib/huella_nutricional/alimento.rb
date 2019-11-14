class Alimento

	attr_accessor :nombre,:kg_gei,:area_terreno,:proteinas

	def initialize(nombre,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo)
		@nombre,@kg_gei,@area_terreno,@proteinas= nombre,kg_gei,area_terreno,proteinas			
	end
end
