class Alimento

	attr_accessor :nombre, :kg_gei, :area_terreno,:proteinas,:carbohidratos,:lipidos,:valor_energetico_recomendado

	def initialize(nombre,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo)
		@nombre,@kg_gei,@area_terreno,@proteinas,@carbohidratos,@lipidos,@sexo= nombre,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo

		if(sexo.eql?("hombre"))
			@valor_energetico_recomendado = 3000
		elsif(sexo.eql?("mujer")) 
			@valor_energetico_recomendado = 2000
		end
			
	end
end