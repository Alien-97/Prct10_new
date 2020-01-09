
class Menu

	attr_reader :nombre,:descripcion, :componente, :precio, :lista_platos,:platos

	# platos, lista_platos, plato( el parametro que recibes en el metodo plato) es lo que te pasa el usuario en el dsl
	# lista_platos es la lista de objetos plato que el usuario desea incluir en el menú
	# platos son los platos que admite tu menu, mi pregunta es ... de donde se sacan esos platos que admite el menú

	def initialize(nombre,platos,&block)
		@nombre = nombre
		@componente = []
		@precio = precio
		@platos = platos
		@lista_platos = []


		if block_given?  
  			if block.arity == 1
   				yield self
  			else
   				instance_eval(&block) 
  			end
    	end
	end

	def plato(plato)
		@platos.each |item| do
			if plato[:descripcion] == item.nombre
					relacion_gramos = plato[:gramos] / item.acc_cantidad_alimentos

					@lista_platos << item * relacion_gramos
			end
		end
	end

	def descripcion (desc)
		@descripcion = desc
	end

	def componente(comida)
		
		if comida.keys == ([:descripcion,:precio])
			@componente << comida
		end
	end

	def precio (price)
		@precio = price
	end

	def to_s
	end

	def valor_calorico_total

		vct = platos.inject{|sum,plato| sum + plato.valor_calorico_total}

		vct
	end

	def valor_ambiental

		va = platos.inject{|sum,plato| sum + plato.valor_ambiental}

		va
	end

	def to_s

		s = ""

		if @nombre.is_a?(String)

			s += "nombre del menú " + @nombre + " Se compone de :" + "\n\n"

			s += "lista de platos del menú " + "\n\n";

			@lista_platos.each |item| do

				s += "\n"
				s += item.to_s

				s += "\n"
			end
		end

		s

	end
	
end