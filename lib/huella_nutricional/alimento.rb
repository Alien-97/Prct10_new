class Alimento

	attr_accessor :nombre_alimento,:kg_gei,:area_terreno,:proteinas,:carbohidratos,:lipidos,:sexo,:cantidad_elemento

	def initialize(nombre_alimento,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo,cantidad_elemento)

		@nombre_alimento,@kg_gei,@area_terreno,@proteinas,@carbohidratos,@lipidos,@sexo,@cantidad_elemento= nombre_alimento,kg_gei,area_terreno,proteinas,carbohidratos,lipidos,sexo,cantidad_elemento			
	end


	def valor_energetico_alimento
		@val_energetico_alimento = (((4 * @carbohidratos + 9 * @proteinas + 4 * @lipidos) * 100).round) / 100.0
	end


	def consumo_adecuado_proteinas

		cantidad_recomendada_proteinas_hombre = 54.0
		cantidad_recomendada_proteinas_mujer = 41.0
		cantidad_alimento_a_consumir = 0.0
		usted_consume_bien = " No se preocupe, con 100 g " + @nombre_alimento + " usted consume lo suficiente de proteinas "
		if @sexo === "hombre"
			if @proteinas < 54.0
				return cantidad_alimento_a_consumir = 100 * cantidad_recomendada_proteinas_hombre / @proteinas
			end
		elsif @sexo === "mujer"
			if @proteinas < 41.0
				return catidad_alimento_a_consumir = 100 * cantidad_recomendada_proteinas_mujer / @proteinas
			end
		end

		usted_consume_bien

	end

	def to_s
		salida = "#{ "100 g de " + @nombre_alimento + " los kg de gases de efecto invernadero que genera son: " + @kg_gei.to_s + " y la cantidad de terreno en metros cuadrados usado en producirlo son: " + @area_terreno.to_s + " Comer un kilo de " + @nombre_alimento + " te da " + @proteinas.to_s + " gramos de proteinas " + " y " + @carbohidratos.to_s + " gramos de carbohidratos " + " y " + @lipidos.to_s + " gramos de lipidos " + " Su valor energetico es: " + valor_energetico_alimento.to_s} "
	end

	def imprime_mensaje_recomendacion
		consumo_adecuado_proteinas.to_s
		gramos_a_consumir = " gramos de " + @nombre_alimento + " para llegar al minimo recomendado "
		if consumo_adecuado_proteinas.is_a?(String) == false
			consumo_adecuado_proteinas.to_s + " gramos de " + @nombre_alimento + " para llegar al minimo recomendado de proteinas "
		elsif consumo_adecuado_proteinas.is_a?(String) == true
			consumo_adecuado_proteinas
		end
	end

	def impacto_ambiental(alimentos)
		acc = 0
		acc_kcal = 0
		acc_gei = 0
		acc_proteinas = 0
		prev_item = " "
		if alimentos.length >= 2
			alimentos.each do |alimento,indice|
				puts "El indice que estoy analizando ahora (1) #{indice}"
				if indice.to_i >= 1
					if (alimento.sexo <=> prev_item)!=0
						puts "El indice que estoy analizando ahora (2) " + indice.to_i
						raise ArgumentError, "El menu lo debe consumir la misma persona, debe especificar el mismo genero en cada alimento"
					end
				end
				if alimento.instance_of?Alimento
					acc_kcal += alimento.valor_energetico_alimento
					acc_gei += alimento.kg_gei
					acc_proteinas += alimento.proteinas
					prev_item = alimento.sexo
				else
					raise ArgumentError, "Error: uno o mas  argumentos no son de tipo alimento "
				end
			end
		elsif alimentos.length < 2
			raise ArgumentError, "Numero de argumentos incorrecto, debe introducir 2 o más alimentos "
		end

		if (acc_proteinas < 54.0 || acc_kcal < 3000 ) && sexo === "hombre"
			raise RuntimeError, "No se puede calcular el GEI, cantidad de proteinas y/o calorias por debajo de la recomendada"
		elsif sexo === "mujer" && (acc_proteinas < 41 || acc_kcal < 2300)
			raise RuntimeError, "No se puede calcular el GEI, cantidad de proteinas y/o calorias por debajo de la recomendada"
		end
		return acc_gei
	
	end


end

	@carne_vaca = Alimento.new("carne de vaca",50.0,164.0,21.1,0.0,3.1,"hombre",100)
	@huevos = Alimento.new("huevos",4.2,5.7,13.0,1.1,11.0,"mujer",100)
	@cafe = Alimento.new("cafe",0.4,0.3,0.1,0.0,0.0,"hombre",100)
	@biste = Alimento.new("biste",180.0,400.0,54.5,48.9,68.5,"hombre",100)
	@caviar = Alimento.new("caviar",400.0,850.0,199.5,101.4,96.8,"hombre",100)

	@menu_hombre = [@carne_vaca,@huevos]

	puts @carne_vaca.impacto_ambiental(@menu_hombre)