class PlatoHuellaNutricional

	attr_reader :nombre,:lista_alimentos
	def initialize(nombre,lista_alimentos)
		@nombre,@lista_alimentos= nombre,lista_alimentos
	end

	def peso_conjunto_alimentos
		acc_cantidad_alimento = 0

		lista_alimentos.each do |alimento|

			acc_cantidad_alimento += alimento.cantidad_elemento
		end

		acc_cantidad_alimento
	end
end