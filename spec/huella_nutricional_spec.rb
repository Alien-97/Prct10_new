RSpec.describe HuellaNutricional do
  it "has a version number" do
    expect(HuellaNutricional::VERSION).not_to be nil
  end

  describe Alimento do
  	before :all do
  		@carne_vaca = Alimento.new("carne de vaca",50.0,164.0,21.1,0.0,3.1,"hombre",100)
		@huevos = Alimento.new("huevos",4.2,5.7,13.0,1.1,11.0,"hombre",100)
		@cafe = Alimento.new("cafe",0.4,0.3,0.1,0.0,0.0,"hombre",100)
		@biste = Alimento.new("biste",180.0,400.0,54.5,85.9,10.5,"hombre",100)
		@caviar = Alimento.new("caviar",400.0,850.0,199.5,120.4,21.8,"hombre",100)

		
		@menu_hombre = [@carne_vaca,@huevos,@cafe,@biste,@caviar,@caviar,@biste]

		@pasta_con_atun = Alimento.new("pasta con atun",79.0,280.0,58.9,77.4,80.6,"mujer",100)
		@arroz_a_la_cubana = Alimento.new("arroz a la cubana",82.9,400.6,94.7,89.9,86.4,"mujer",100)
		@mousse_chocolate = Alimento.new("mouse chocolate",99.4,95.6,86.7,99.3,103.8,"mujer",100)

		@menu_mujer = [@pasta_con_atun,@arroz_a_la_cubana,@mousse_chocolate]

		#@lista_dieta_guay = Lista.new
	end


	context "Probando los attr_accessors" do
		it "Se ha de poder instanciar un alimento"do
			expect(@carne_vaca.instance_variable_defined?(:@nombre_alimento)).to eq(true)
		end

		it "Se ha de poder instanciar los gases de efecto invernadero"do
			expect(@carne_vaca.instance_variable_defined?(:@kg_gei)).to eq(true)
		end

		it"Se ha de poder instanciar los metros cuadrados de terreno"do
			expect(@carne_vaca.instance_variable_defined?(:@area_terreno)).to eq(true)
		end

		it"Se han de poder instanciar las proteinas"do
			expect(@carne_vaca.instance_variable_defined?(:@proteinas)).to eq(true)
		end

		it"Se ha de poder instanciar carbohidratos"do
			expect(@carne_vaca.instance_variable_defined?(:@carbohidratos)).to eq(true)

		end
		it"Se ha de poder instanciar lipidos"do
			expect(@carne_vaca.instance_variable_defined?(:@lipidos)).to eq(true)
		end

		it"Se ha de poder instanciar el genero de la persona"do
			expect(@carne_vaca.instance_variable_defined?(:@sexo)).to eq(true)
		end

	end

	context "Probando el metodo devolver  atributos"do

		it"Se ha de poder obtener el nombre del alimento"do

			expect(@carne_vaca.respond_to?("nombre_alimento")).to eq(true)
		end

		it"Se ha de poder obtener los gases de efecto invernadero del alimento"do

			expect(@carne_vaca.respond_to?("kg_gei")).to eq(true)
		end

		it"Se ha de poder obtener la cantidad de terreno usada"do
			expect(@carne_vaca.respond_to?("area_terreno")).to eq(true)
		end
	end

	context "Probando el metodo devolver valor energetico"do
		
		it"Debe existir el metodo para obtener el valor energetico"do
			expect(@carne_vaca.respond_to?("valor_energetico_alimento")).to eq(true)
		end

		it"Se ha de poder obtener el valor energetico"do
			expect(@carne_vaca.valor_energetico_alimento).to eq(112.3)
		end
	end

	context "Probando el metodo consumo adecuado proteinas"do
		it"Debe existir el metodo para ver si su alimento se ajusta a las recomendaciones diarias de proteinas"do
			expect(@carne_vaca.respond_to?("consumo_adecuado_proteinas")).to eq(true)
		end

		it"Se ha de poder obtener el consumo adecuado del alimento para consumir el minimo recomendado de proteinas segun su genero"do
			expect(@carne_vaca.consumo_adecuado_proteinas).to eq(255.9241706161137)
		end
	end

	context "Probando el metodo to_s"do
		it"Se debe poder obtener la salida formateada de las variables de instancia y toda la información almacenada del alimento"do
			expect(@carne_vaca.to_s).to eq("100 g de carne de vaca los kg de gases de efecto invernadero que genera son: 50.0 y la cantidad de terreno en metros cuadrados usado en producirlo son: 164.0 Comer un kilo de carne de vaca te da 21.1 gramos de proteinas  y 0.0 gramos de carbohidratos  y 3.1 gramos de lipidos  Su valor energetico es: 112.3 ")
		end
	end

	context "Probando el metodo del impacto ambiental"do

		it"Debe existir un metodo que calcula el impacto ambiental"do
			expect(@carne_vaca.respond_to?("impacto_ambiental")).to eq(true)
		end

		it" Se ha de obtener el impacto ambiental para un hombre"do
			expect(@carne_vaca.impacto_ambiental(@menu_hombre)).to eq(1214.6)
		end

		it" Se ha de poder obtener el impacto ambiental para una mujer"do
			expect(@carne_vaca.impacto_ambiental(@menu_mujer)).to eq(261.3)
		end
	end

  end

  	describe Lista do

		before :all do
			
        	@carne_vaca = Alimento.new("carne de vaca",50.0,164.0,21.1,0.0,3.1,"hombre",100)
        	@huevos = Alimento.new("huevos",4.2,5.7,13.0,1.1,11.0,"hombre",100)
        	@cafe = Alimento.new("cafe",0.4,0.3,0.1,0.0,0.0,"hombre",100)
        	@biste = Alimento.new("biste",180.0,400.0,84.5,48.9,18.5,"hombre",100)
        	@caviar = Alimento.new("caviar",400.0,850.0,89.5,49.4,20.8,"hombre",100)
        	@garbanzos = Alimento.new("alimento",230.0,350.0,101.6,51.8,20.1,"hombre",100)
        	@menu_hombre = [@carne_vaca,@huevos,@cafe,@biste,@caviar]

        	@pasta_con_atun = Alimento.new("pasta con atun",79.0,280.0,58.9,76.4,20.6,"hombre",100)
        	@arroz_a_la_cubana = Alimento.new("arroz a la cubana",82.9,400.6,94.7,83.9,25.4,"hombre",100)
        	@pollo = Alimento.new("pollo",5.7,7.1,20.6,0.0,5.6,"hombre",100)
        	@leche_vaca = Alimento.new("leche vaca",3.2,8.9,3.3,4.8,3.2,"hombre",100)
        	@chocolate = Alimento.new("chocolate",2.3,3.4,5.3,47.0,30.0,"hombre", 100)
        	@menu_mujer = [@pasta_con_atun,@arroz_a_la_cubana,@mousse_chocolate]

        	@lista_dieta_guay = Lista.new

			@nodo = Nodo.new(@chocolate * 10,nil,nil)

			@nodo2 = Nodo.new(@huevos * 4,nil,nil)
			@nodo3 = Nodo.new(@leche_vaca * 3,nil,nil)
			
			@nodo5 = Nodo.new(@pollo * 5,nil,nil)
			@nodo6 = Nodo.new(@carne_vaca * 6,nil,nil)
		end

	  	context " Probando las variables de instancia que deben existir "do
		  	it " Se ha de poder instanciar la cabeza de la lista "do
				expect(@lista_dieta_guay.instance_variable_defined?(:@head)).to eq true
		  	end

		  	it " Se ha de poder instanciar la cola de la lista "do
		  		expect(@lista_dieta_guay.instance_variable_defined?(:@tail)).to eq true
		  	end

		  	it " Se ha de poder instanciar la cabeza de la lista "do
		  		expect(@lista_dieta_guay.instance_variable_defined?(:@sz)). to eq true
		  	end
		end

		context " Probando los metodos de instancia "do
			it " Debe existir el getter de la cabeza" do
				expect(@lista_dieta_guay.respond_to?("head")). to eq true
			end

			it " Debe existir el getter de la cola" do
				expect(@lista_dieta_guay.respond_to?("tail")). to eq true
			end

			it " Debe existir el getter del size" do
				expect(@lista_dieta_guay.respond_to?("sz")). to eq true
			end

		end

		context " Probando metodos en la lista "do
			it "Probando metodo insercion por la cabeza"do
				expect(@lista_dieta_guay.respond_to?("push_head")).to eq true
				@lista_dieta_guay.push_head(@nodo)
				expect(@lista_dieta_guay.head). to eq @nodo
			end
		end

		context "Comprobando la dieta"do
			it"Comprobando que la dieta se ajusta a los parámetros pedidos"do
				@lista_dieta_guay.push_head(@nodo2)
				@lista_dieta_guay.push_head(@nodo3)
				
				@lista_dieta_guay.push_head(@nodo5)
				@lista_dieta_guay.push_head(@nodo6)
				acc_vea = 0
				acc_c = 0
				acc_p = 0
				acc_l = 0
				acc_gei = 0
				acc_t = 0
				i = 0
				iterator = @lista_dieta_guay.head
				while iterator!=nil
					if iterator!= @lista_dieta_guay.head
						#puts " Sexo del nodo actual " + "#{iterator.value.sexo}"
						puts " Sexo del nodo previo " + "#{iterator.prev.value.sexo}"
						expect(iterator.value.sexo).to eq iterator.prev.value.sexo
						puts " Sexo de la persona  " + "#{iterator.value.sexo}"
						puts " el iterador " + "#{i}"
					end

					aux = iterator.value
					expect(aux.class).to eq Alimento
					expect(aux.carbohidratos.class).to eq Float
					expect(aux.lipidos.class).to eq Float
					expect(aux.proteinas.class).to eq Float
					acc_vea += aux.valor_energetico_alimento
					acc_c += aux.carbohidratos * 4
					acc_p += aux.proteinas * 4
					acc_l += aux.lipidos * 9
					acc_gei += aux.kg_gei
					acc_t += aux.area_terreno
					iterator = iterator.next
					i = i +1
				end

				puts acc_gei
				puts acc_t
				puts acc_vea
				expect(acc_vea).to be >= 3000 
				expect(acc_c.to_i).to be_between((0.10*acc_vea).to_i,(0.401*acc_vea).to_i).inclusive 
				expect(acc_p.to_i).to be_between((0.16*acc_vea).to_i,(0.201*acc_vea).to_i).inclusive 
				expect(acc_gei). to eq (800)
				
				
			end
		end
  	end

end
