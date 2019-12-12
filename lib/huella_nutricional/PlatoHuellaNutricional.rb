=begin
require '/home/alien/Escritorio/INGENIERÍA_INFORMÁTICA/CUARTO/TERCERO/LPP/Prácticas/Prct8/tdd-Alien-97/lib/huella_nutricional/alimento.rb'
require '/home/alien/Escritorio/INGENIERÍA_INFORMÁTICA/CUARTO/TERCERO/LPP/Prácticas/Prct8/tdd-Alien-97/lib/huella_nutricional/lista.rb'
=end
class PlatoHuellaNutricional
	include Comparable

	attr_reader :nombre,:lista_alimentos,:acc_cantidad_alimentos
	def initialize(nombre,lista_alimentos,acc_cantidad_alimentos)
		@nombre,@lista_alimentos,@acc_cantidad_alimentos= nombre,lista_alimentos,acc_cantidad_alimentos

		i = 0
		lista_alimentos.each do |alimento|

			if alimento.class == Alimento
				@acc_cantidad_alimentos += alimento.cantidad_elemento
			else
				raise TypeError, "Uno de los alimentos de la lista no es de tipo alimento"
			end

			i+=1
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

	def porcentaje_lipidos

		acc_lipidos = 0

		lista_alimentos.each do |alimento|
			if alimento.instance_of? Alimento
				acc_lipidos += alimento.lipidos
			else
				raise TypeError, "Uno de los alimentos de la lista no es de tipo alimento"
			end
		end

		pr_lipidos = ((acc_lipidos/acc_cantidad_alimentos) * 100).round(2)
		pr_lipidos		

	end

	def valor_calorico_total
		acc_vct = 0

		lista_alimentos.each do |alimento|
			if alimento.instance_of? Alimento
				acc_vct += alimento.valor_energetico_alimento
			else
				raise TypeError, "Uno de los alimentos de la lista no es de tipo alimento"
			end
		end

		acc_vct = acc_vct.round(2)
		acc_vct
	end

	def to_s
        s = ""

        if @nombre.is_a?(String)

        	s += "nombre del plato " + @nombre + " se compone de :" + "\n\n"

        	
        	s += @lista_alimentos.to_s + "\n"

        	s += "peso total en gramos de los alimentos del plato " + @acc_cantidad_alimentos.to_s + "\n"

        	s += "porcentaje de proteinas en el plato " + porcentaje_proteinas.to_s + "\n"

        	s += "porcentaje de carbohidratos en el plato " + porcentaje_carbohidratos.to_s + "\n"

        	s += "porcentaje de lipidos en el plato " + porcentaje_lipidos.to_s + "\n\n"
        	s
        end
    end

    def <=> (other)
    	if other.instance_of? PlatoHuellaNutricional
    		valor_calorico_total <=> other.valor_calorico_total
    	end
    end

    
end

=begin
@carne_vaca = Alimento.new("carne de vaca",50,164.0,21.1,0.0,3.1,"hombre",100)
@huevos = Alimento.new("huevos",4.2,5.7,13.0,1.1,11.0,"hombre",100)
@lentejas = Alimento.new("lentejas",0.4,3.4,23.5,52.0,1.4,"hombre",100)

@nodo_carne_vaca = Nodo.new(@carne_vaca,nil,nil)
@nodo_huevos = Nodo.new(@huevos,nil,nil)
@nodo_lentejas = Nodo.new(@lentejas,nil,nil)

@lista_alimentos_plato = Lista.new

@lista_alimentos_plato.push_tail(@nodo_carne_vaca)
@lista_alimentos_plato.push_tail(@nodo_huevos)
@lista_alimentos_plato.push_tail(@nodo_lentejas)

@acc_cantidad_alimentos = 0


@plato1 = PlatoHuellaNutricional.new( " plato tradicional ",@lista_alimentos_plato,@acc_cantidad_alimentos)

puts @plato1.to_s
=end
