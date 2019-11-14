class Alimento

	attr_accessor :nombre,:kg_gei

	def initialize(nombre,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo)
		@nombre,@kg_gei= nombre,kg_gei			
	end
end
