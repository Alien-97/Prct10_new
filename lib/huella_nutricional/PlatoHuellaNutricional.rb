class PlatoHuellaNutricional

	attr_reader :nombre,:lista_alimentos
	def initialize(nombre,lista_alimentos)
		@nombre,@lista_alimentos= nombre,lista_alimentos
	end

	def peso_conjunto_alimentos

		acc_cantidad_alimento = 0

		lista_alimentos.each do |alimento|
			if alimento.class == Alimento
				acc_cantidad_alimento += alimento.cantidad_elemento
			else
				raise TypeError, "Uno de los alimentos de la lista no es de tipo alimento"
			end
		end

		acc_cantidad_alimento
	end

	def porcentaje_proteinas

		

	end

end