class PlatoHuellaNutricional

	attr_reader :nombre,:lista_alimentos,:acc_cantidad_alimentos
	def initialize(nombre,lista_alimentos,acc_cantidad_alimentos)
		@nombre,@lista_alimentos,@acc_cantidad_alimentos= nombre,lista_alimentos,acc_cantidad_alimentos

		lista_alimentos.each do |alimento|
			if alimento.class == Alimento
				@acc_cantidad_alimentos += alimento.cantidad_elemento
			else
				raise TypeError, "Uno de los alimentos de la lista no es de tipo alimento"
			end
		end

	end


	def porcentaje_proteinas

		acc_proteinas = 0

		lista_alimentos.each do |alimento|
			if alimento.instance_of? Alimento
				acc_proteinas += alimento.proteinas
			else
				raise TypeError, "Uno de los alimentos de la lista no es de tipo alimento"
			end
		end

		pr_proteinas = ((acc_proteinas/acc_cantidad_alimentos) * 100).round(2)
		pr_proteinas
	end

	def porcentaje_carbohidratos

		acc_carbohidratos = 0

		lista_alimentos.each do |alimento|
			if alimento.instance_of? Alimento
				acc_carbohidratos += alimento.carbohidratos
			else
				raise TypeError, "Uno de los alimentos de la lista no es de tipo alimento"
			end
		end

		pr_carbohidratos = ((acc_carbohidratos/acc_cantidad_alimentos) * 100).round(2)
		pr_carbohidratos

	end

end