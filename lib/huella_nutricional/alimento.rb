class Alimento

	attr_accessor :nombre,:kg_gei,:area_terreno

	def initialize(nombre,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo)
		@nombre,@kg_gei,@area_terreno= nombre,kg_gei,area_terreno			
	end
end
