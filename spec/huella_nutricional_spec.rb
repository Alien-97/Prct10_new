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
			@pollo = Alimento.new("pollo",5.7,7.1,20.6,0.0,5.6,"hombre",100)
	    	@leche_vaca = Alimento.new("leche vaca",3.2,8.9,3.3,4.8,3.2,"hombre",100)
	    	@chocolate = Alimento.new("chocolate",2.3,3.4,5.3,47.0,30.0,"hombre", 100)
			
			@lentejas = Alimento.new("lentejas",0.4,3.4,23.5,52.0,1.4,"hombre",100)
			@menu_hombre = [@carne_vaca,@huevos,@cafe,@biste,@caviar,@caviar,@biste]

			@pasta_con_atun = Alimento.new("pasta con atun",79.0,280.0,58.9,77.4,80.6,"mujer",100)
			@arroz_a_la_cubana = Alimento.new("arroz a la cubana",82.9,400.6,94.7,89.9,86.4,"mujer",100)
			@mousse_chocolate = Alimento.new("mouse chocolate",99.4,95.6,86.7,99.3,103.8,"mujer",100)

			@menu_mujer = [@pasta_con_atun,@arroz_a_la_cubana,@mousse_chocolate]
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
				expect(@carne_vaca.to_s).to eq( @carne_vaca.cantidad_elemento.to_s + " " + "g" + " " + "de " + "#{@carne_vaca.nombre_alimento}" + " los kg de gases de efecto invernadero que genera son: 50.0 y la cantidad de terreno en metros cuadrados usado en producirlo son: 164.0 Comer un kilo de carne de vaca te da 21.1 gramos de proteinas  y 0.0 gramos de carbohidratos  y 3.1 gramos de lipidos  Su valor energetico es: 112.3 ")
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

		context "Pruebas de comparacion de alimentos "do
			it "Prueba para comparable menor"do
				expect(@leche_vaca < @pollo).to eq true
			end

			it "Prueba para comparable mayor"do
				expect(@leche_vaca > @pollo).to eq false
			end

			it "Prueba para comparable mayor o igual"do
				expect(@leche_vaca >= @pollo).to eq false
			end

			it "Prueba para comparable menor o igual"do
				expect(@leche_vaca <= @pollo).to eq true
			end

			it "Prueba para comparable between"do
				expect(@pollo.between?(@leche_vaca,@huevos)).to eq true
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

			@nodo7 = Nodo.new(@chocolate * 10,nil,nil)
			@nodo8 = Nodo.new(@huevos * 10,nil,nil)
			@nodo2 = Nodo.new(@huevos * 4,nil,nil)
			@nodo3 = Nodo.new(@leche_vaca * 3,nil,nil)
			
			@nodo5 = Nodo.new(@pollo * 5,nil,nil)
			@nodo6 = Nodo.new(@carne_vaca * 6,nil,nil)

			@lista_pruebas = Lista.new

			@lista_enumerable = Lista.new

			@nodoguay = Nodo.new(Alimento.new("chocolate",2.3,3.4,5.3,47.0,30.0,"hombre", 100),nil,nil)
			@nodoguay1 = Nodo.new(Alimento.new("pollo",5.7,7.1,20.6,0.0,5.6,"hombre",100),nil,nil)
			@nodoguay2 = Nodo.new(Alimento.new("leche vaca",3.2,8.9,3.3,4.8,3.2,"hombre",100),nil,nil)

			@lista_enumerable.push_head(@nodoguay2)
			@lista_enumerable.push_head(@nodoguay1)
			@lista_enumerable.push_head(@nodoguay)

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

		context " Probando metodos insercion en la lista "do
			it "Probando metodo insercion por la cabeza"do
				expect(@lista_dieta_guay.respond_to?("push_head")).to eq true
				@lista_dieta_guay.push_head(@nodo)
				expect(@lista_dieta_guay.head).to eq @nodo
			end

			it"Probando metodo insercion por la cola"do
				expect(@lista_pruebas.respond_to?("push_tail")).to eq true
				@lista_pruebas.push_tail(@nodo7)
				expect(@lista_pruebas.tail).to eq @nodo7
			end

			it"Probando metodo insercion en cualquier posicion"do
				expect(@lista_pruebas.respond_to?("insert")).to eq true
				@lista_pruebas.insert(@nodo8,1)
				expect(@lista_pruebas.sz).to eq 2
			end
		end

		context "Probando metodos borrado en la lista"do
			it "Probando metodo borrado por la cabeza "do
				expect(@lista_pruebas.respond_to?("pop_head")).to eq true
				@lista_pruebas.pop_head
				expect(@lista_pruebas.sz).to eq 1
			end

			it"Probando metodo borrado por la cola"do
				expect(@lista_pruebas.respond_to?("pop_tail")).to eq true
				@lista_pruebas.pop_tail
				expect(@lista_pruebas.sz).to eq 0
			end

			it" Probando metodo eliminacion en cualquier posicion"do
				@lista_pruebas.push_head(@nodo7)
				@lista_pruebas.push_head(@nodo8)
				expect(@lista_pruebas.respond_to?("delete")).to eq true
				@lista_pruebas.delete(1)
				expect(@lista_pruebas.sz).to eq 1
			end
		end

		context "Comprobando la dieta guay"do
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
						
						expect(iterator.value.sexo).to eq iterator.prev.value.sexo
						
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

				expect(acc_vea).to be >= 3000 
				expect(acc_c.to_i).to be_between((0.10*acc_vea).to_i,(0.401*acc_vea).to_i).inclusive 
				expect(acc_p.to_i).to be_between((0.16*acc_vea).to_i,(0.201*acc_vea).to_i).inclusive 
				expect(acc_gei.to_i). to eq (377)
				expect(acc_t.to_i).to eq (1103)
				
			end
		end

		context "Pruebas del modulo enumerable para listas "do
			it "Prueba del collect"do
				expect(@lista_enumerable.head.value.to_s).to eq ("#{@nodoguay.value}")
				expect(@lista_enumerable.head.next.value.to_s).to eq ("#{@nodoguay1.value}")
				expect(@lista_enumerable.head.next.next.value.to_s).to eq ("#{@nodoguay2.value}")
				expect(@lista_enumerable.collect { |i| i.to_s}).to eq (["#{@nodoguay.value}","#{@nodoguay1.value}","#{@nodoguay2.value}"])
			end

			it "Prueba del select" do
				expect(@lista_enumerable.select { |i| i.between?(@nodoguay2.value,@nodoguay.value)}). to eq ([@nodoguay.value,@nodoguay1.value,@nodoguay2.value])
			end

			it "Prueba del max"do
				expect(@lista_enumerable.max). to eq @nodoguay.value
			end

			it "Prueba del min"do
				expect(@lista_enumerable.min). to eq @nodoguay2.value
			end

			it "Prueba de sort"do
				expect(@lista_enumerable.sort).to eq ([@nodoguay2.value,@nodoguay1.value,@nodoguay.value])
			end
		end
  	end

  	describe PlatoHuellaNutricional do

  		before :all do
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
  			@plato_tradicional = PlatoHuellaNutricional.new("plato tradicional",@lista_alimentos_plato,@acc_cantidad_alimentos)

  			@salmon = Alimento.new("salmon",6.0,3.7,19.9,0.0,6.6,"hombre",100)

  			@nuez = Alimento.new("nuez",0.3,7.9,20.0,21.0,54.0,"hombre",100)

  			@tofu = Alimento.new("tofu",2.0,2.2,8.0,1.9,4.8,"hombre",100)

  			@camarones = Alimento.new("camarones",18.0,2.0,17.6,1.5,0.6,"hombre",100)

  			@nodo_salmon = Nodo.new(@salmon,nil,nil)
  			@nodo_nuez = Nodo.new(@nuez,nil,nil)
  			@nodo_tofu = Nodo.new(@tofu,nil,nil)
  			@nodo_camarones = Nodo.new(@camarones,nil,nil)

  			@lista_alimentos_dieta_oriental = Lista.new

  			@lista_alimentos_dieta_oriental.push_tail(@nodo_salmon)
  			@lista_alimentos_dieta_oriental.push_tail(@nodo_nuez)
  			@lista_alimentos_dieta_oriental.push_tail(@nodo_tofu)
  			@lista_alimentos_dieta_oriental.push_tail(@nodo_camarones)

  			@acc_cantidad_alimentos2 = 0

  			@plato_dieta_oriental = PlatoHuellaNutricional.new("plato dieta oriental",@lista_alimentos_dieta_oriental,@acc_cantidad_alimentos2)

  			@salmon_2 = @salmon * 2
  			@nuez_2 = @nuez * 2
  			@tofu_2 = @tofu * 2
  			@camarones_2 = @camarones * 2

  			@nodo_salmon_2 = Nodo.new(@salmon,nil,nil)
  			@nodo_nuez_2 = Nodo.new(@nuez,nil,nil)
  			@nodo_tofu_2 = Nodo.new(@tofu,nil,nil)
  			@nodo_camarones_2 = Nodo.new(@camarones,nil,nil)

  			@lista_dieta_oriental_fuerte = Lista.new

  			@lista_dieta_oriental_fuerte.push_tail(@nodo_salmon_2)
  			@lista_dieta_oriental_fuerte.push_tail(@nodo_nuez_2)
  			@lista_dieta_oriental_fuerte.push_tail(@nodo_tofu_2)
  			@lista_dieta_oriental_fuerte.push_tail(@nodo_camarones_2)

  			@acc_cantidad_alimentos3 = 0


  			@plato_dieta_oriental_fuerte = PlatoHuellaNutricional.new("plato dieta oriental doble racion", @lista_dieta_oriental_fuerte,@acc_cantidad_alimentos3)

  			@carne_vaca2 = Alimento.new("carne de vaca",50,164.0,21.1,0.0,3.1,"hombre",100)
  			@carne_vaca3 = Alimento.new("carne de vaca",50,164.0,21.1,0.0,3.1,"hombre",100)
  			@huevos2 = Alimento.new("huevos",4.2,5.7,13.0,1.1,11.0,"hombre",100)
  			@lentejas2 = Alimento.new("lentejas",0.4,3.4,23.5,52.0,1.4,"hombre",100)
  			@leche_de_vaca = Alimento.new("leche vaca",3.2,8.9,3.3,4.8,3.2,"hombre",100)

  			@nodo_carne_vaca2 = Nodo.new(@carne_vaca2,nil,nil)
  			@nodo_carne_vaca3 = Nodo.new(@carne_vaca2,nil,nil)
  			@nodo_huevos_2 = Nodo.new(@huevos2 * 3,nil,nil)
  			@nodo_lentejas_2 = Nodo.new(@lentejas2,nil,nil)
  			@nodo_leche_vaca_2 = Nodo.new(@leche_de_vaca,nil,nil)

  			@lista_dieta_espaniola = Lista.new

  			@lista_dieta_espaniola.push_tail(@nodo_carne_vaca2)
  			@lista_dieta_espaniola.push_tail(@nodo_huevos_2)
  			@lista_dieta_espaniola.push_tail(@nodo_lentejas_2)
  			@lista_dieta_espaniola.push_tail(@nodo_leche_vaca_2)

  			acc_cantidad_alimentos_dieta_espaniola = 0

  			@plato_dieta_espaniola = PlatoHuellaNutricional.new("plato dieta española",@lista_dieta_espaniola,acc_cantidad_alimentos_dieta_espaniola)


  			@carne_cordero2 = Alimento.new("carne cordero",20.0,185.0,18.0,0.0,17.0, "hombre",100)
  			@carne_cordero3 = Alimento.new("carne cordero",20.0,185.0,18.0,0.0,17.0, "hombre",100)
  			@chocolate2 = Alimento.new("chocolate",2.3,3.4,5.3,47.0,30.0,"hombre",100)
  			@queso = Alimento.new("queso",11.0,41.0,25.0,1.3,33.0,"hombre",100)
  			@salmonillo = Alimento.new("salmon",6.0,3.7,19.9,0.0,6.6,"hombre",100)
  			@nuecillo = Alimento.new("nuez",0.3,7.9,20.0,21.0,54.0,"hombre",100)

  			@tofillo = Alimento.new("tofu",2.0,2.2,8.0,1.9,4.8,"hombre",100)

  			@camarones_de_dakhla = Alimento.new("camarones",18.0,2.0,17.6,1.5,0.6,"hombre",100)

  			@camarones_de_dakhla2 = Alimento.new("camarones",18.0,2.0,17.6,1.5,0.6,"hombre",100)

  			@nodo_carne_cordero = Nodo.new(@carne_cordero2 * 3,nil,nil)
  			@nodo_carne_cordero2 = Nodo.new(@carne_cordero3 * 2.5,nil,nil)
  			@nodo_chocolate = Nodo.new(@chocolate2 * 2,nil,nil)
  			@nodo_queso = Nodo.new(@queso,nil,nil)
  			@nodo_tofillo = Nodo.new(@tofillo * 2,nil,nil)
  			@nodo_nuecillo = Nodo.new(@nuecillo * 2,nil,nil)
  			@nodo_camarones_dakhla = Nodo.new(@camarones_de_dakhla,nil,nil)
  			@nodo_camarones_dakhla2 = Nodo.new(@camarones_de_dakhla2,nil,nil)
  			@lista_dieta_vasca = Lista.new

  			@lista_dieta_vasca.push_tail(@nodo_carne_cordero)
  			@lista_dieta_vasca.push_tail(@nodo_chocolate)

  			acc_cantidad_alimentos_vasca = 0

  			@plato_dieta_vasca = PlatoHuellaNutricional.new(" plato dieta vasca",@lista_dieta_vasca,acc_cantidad_alimentos_vasca)

  			@lista_dieta_vegetaria = Lista.new

  			@lista_dieta_vegetaria.push_tail(@nodo_tofillo)
  			@lista_dieta_vegetaria.push_tail(@nodo_nuecillo)
  			@lista_dieta_vegetaria.push_tail(@nodo_queso)

  			@acc_cantidad_alimentos_vegetaria  = 0

  			@plato_dieta_vegetaria = PlatoHuellaNutricional.new(" plato dieta vegetaria",@lista_dieta_vegetaria,@acc_cantidad_alimentos_vegetaria)

  			@lista_dieta_locura_carne = Lista.new

  			@lista_dieta_locura_carne.push_tail(@nodo_carne_vaca3)
  			@lista_dieta_locura_carne.push_tail(@nodo_carne_cordero2)
  			@lista_dieta_locura_carne.push_tail(@nodo_camarones_dakhla)
  			@lista_dieta_locura_carne.push_tail(@nodo_camarones_dakhla2)

  			@acc_cantidad_locura_por_carne = 0

  			@plato_dieta_locura_por_carne = PlatoHuellaNutricional.new( "plato dieta locura por la carne",@lista_dieta_locura_carne,@acc_cantidad_locura_por_carne)

  			@quesesillo = Alimento.new("queso",11.0,41.0,25.0,1.3,33.0,"hombre",100)
  			@salmonillo = Alimento.new("salmon",6.0,3.7,19.9,0.0,6.6,"hombre",100)
  			@nuececillo = Alimento.new("nuez",0.3,7.9,20.0,21.0,54.0,"hombre",100)

  			@tofefillo = Alimento.new("tofu",2.0,2.2,8.0,1.9,4.8,"hombre",100)

  			@nodo_quesesillo = Nodo.new(@carne_cordero2 * 3,nil,nil)
  			@nodo_salmooon = Nodo.new(@carne_cordero3,nil,nil)
  			@nodo_nuecillo = Nodo.new(@chocolate2 * 5,nil,nil)
  			@nodo_tofefillo = Nodo.new(@queso,nil,nil)

  			@lista_dieta_vegetariana = Lista.new

  			@lista_dieta_vegetariana.push_tail(@nodo_quesesillo)
  			@lista_dieta_vegetariana.push_tail(@nodo_nuecillo)
  			@lista_dieta_vegetariana.push_tail(@nodo_tofefillo)

  			@acc_cantidad_alimentos_vegetariana = 0


  			@plato_dieta_vegetariana = PlatoHuellaNutricional.new("plato dieta vegetariana",@lista_dieta_vegetariana,@acc_cantidad_alimentos_vegetariana)

  			puts  "valor energetico dieta española " + @plato_dieta_espaniola.valor_calorico_total.to_s

  			puts  "valor energetico dieta vegetariana " + @plato_dieta_vegetariana.valor_calorico_total.to_s

  			puts "valor energetico dieta vegetaria " + @plato_dieta_vegetaria.valor_calorico_total.to_s

  			puts "valor energetico dieta vasca " + @plato_dieta_vasca.valor_calorico_total.to_s

  			puts "valor energetico dieta locura carne " + @plato_dieta_locura_por_carne.valor_calorico_total.to_s

  			@lista_platos_diferentes_dietas = Lista.new

  			@nodo_dieta_española = Nodo.new(@plato_dieta_espaniola,nil,nil)
  			@nodo_dieta_vegetariana = Nodo.new(@plato_dieta_vegetariana,nil,nil)

  			@nodo_dieta_vegetaria = Nodo.new(@plato_dieta_vegetaria,nil,nil)
  			@nodo_dieta_vasca = Nodo.new(@plato_dieta_vasca,nil,nil)

  			@nodo_dieta_locura_por_carne = Nodo.new(@plato_dieta_locura_por_carne,nil,nil)

  			@lista_platos_diferentes_dietas.push_tail(@nodo_dieta_española)
  			@lista_platos_diferentes_dietas.push_tail(@nodo_dieta_vegetariana)
  			@lista_platos_diferentes_dietas.push_tail(@nodo_dieta_vegetaria)
  			@lista_platos_diferentes_dietas.push_tail(@nodo_dieta_vasca)
  			@lista_platos_diferentes_dietas.push_tail(@nodo_dieta_locura_por_carne)
  		end

  		

  		context "Pruebas clase,tipo y jerarquia de la clase PlatoHuellaNutricional"do

  			it "Pruebas de clase"do
  				expect(@plato_tradicional.class).to eq PlatoHuellaNutricional
  			end

  			it "Pruebas de tipo"do
  				expect(@plato_tradicional.instance_of? PlatoHuellaNutricional).to eq true
  			end

  			it "Pruebas de jerarquía "do
  				expect(@plato_tradicional).to be_kind_of(Object)
  			end
  		end

  		context "Probando variables de instancia "do
  			it "Debe existir el nombre del alimento"do
  				expect(@plato_tradicional.instance_variable_defined?(:@nombre)).to eq true
  			end

  			it "Debe existir la lista de alimentos "do
  				expect(@plato_tradicional.instance_variable_defined?(:@lista_alimentos)).to eq true
  			end

  			it "Debe existir la cantidad del conjunto de alimentos"do
  				expect(@plato_tradicional.instance_variable_defined?(:@acc_cantidad_alimentos)).to eq true
  			end
  		end

  		context "Probando los getters y setters del plato"do
  			it " Debe existir el getter del nombre del alimento"do
  				expect(@plato_tradicional.respond_to?("nombre")).to eq true
  			end

  			it " Debe existir el getter de la lista de alimentos"do
  				expect(@plato_tradicional.respond_to?("lista_alimentos")).to eq true
  			end

  			it " Debe existir el getter de la cantidad de alimentos "do
  				expect(@plato_tradicional.respond_to?("acc_cantidad_alimentos")).to eq true
  				expect(@plato_tradicional.acc_cantidad_alimentos).to be >= 200
  			end

  		end

  		context "Comprobar que todos los alimentos los consume la misma persona "do
  			
  			it "Todos los alimentos del plato han de ser consumidos por la misma persona"do
  				iterator = @lista_alimentos_plato.head
  				

  				puts iterator
				while iterator!=nil
					
					if iterator != @lista_alimentos_plato.head
						
						expect(iterator.value.sexo).to eq iterator.prev.value.sexo
						
					end

					iterator = iterator.next
				end
  			end
  		end

  		context " Deben existir los metodos que calculan el porcentaje de nutrientes en el plato"do
  			it "Debe existir el metodo que devuelve el porcentaje de proteinas " do
  				expect(@plato_tradicional.respond_to?("porcentaje_proteinas")).to eq true
  			end

  			it "Se ha de poder obtener el porcentaje de proteinas" do
  				expect(@plato_tradicional.porcentaje_proteinas).to eq 19.2 
  			end

  			it " Debe existir el metodo que devuelve el porcentaje de carbohidratos " do
  				expect(@plato_tradicional.respond_to?("porcentaje_carbohidratos")).to eq true
  				expect(@plato_tradicional.porcentaje_carbohidratos).to eq 17.7
  			end

  			it " Debe existir el metodo que devuelve el porcentaje de lipidos, y se ha de poder obtener dicho valor " do
  				expect(@plato_tradicional.respond_to?("porcentaje_lipidos")).to eq true
  				expect(@plato_tradicional.porcentaje_lipidos).to eq 5.17
  			end
  		end

  		context " Se calcula el valor calorico total total del plato en kcal"do
  			it "Debe existir el metodo que calcula el valor calorico total, y se ha de poder obtener dicho valor"do
  				expect(@plato_tradicional.respond_to?("valor_calorico_total")).to eq true
  				expect(@plato_tradicional.valor_calorico_total).to eq 582.3
  			end
  		end

  		context " Prueba del metodo to_s" do

  			it "Debe existir el metodo to_s y debe mostrar la salida formateada "do
  				expect(@plato_tradicional.respond_to?("to_s")).to eq true
  				expect(@plato_tradicional.to_s).to eq "nombre del plato " +  @plato_tradicional.nombre + " se compone de :" + "\n\n" +
  														@plato_tradicional.lista_alimentos.to_s + "\n" + "peso total en gramos de los alimentos del plato " + 
  														@plato_tradicional.acc_cantidad_alimentos.to_s + "\n"	+ "porcentaje de proteinas en el plato " + @plato_tradicional.porcentaje_proteinas.to_s + "\n" + "porcentaje de carbohidratos en el plato "+ @plato_tradicional.porcentaje_carbohidratos.to_s + "\n" + "porcentaje de lipidos en el plato " + @plato_tradicional.porcentaje_lipidos.to_s + "\n\n" 
			end
  		end

  		context " Prueba del modulo Comparable de la clase Plato padre" do

  			it " Debe existir el comparable < "do
  				expect(@plato_tradicional < @plato_dieta_oriental).to eq true
  			end

  			it " Debe existir el comparable >"do
  				expect(@plato_tradicional > @plato_dieta_oriental).to eq false
  			end

  			it " Debe existir  el comparable <= "do
  				expect(@plato_tradicional <= @plato_dieta_oriental).to eq true
  			end

  			it "Debe existir el comparable >="do
  				expect(@plato_tradicional >= @plato_dieta_oriental).to eq false
  			end

  			it "Debe existir el comparable between"do

  				expect(@plato_dieta_oriental.between?(@plato_tradicional,@plato_dieta_oriental_fuerte)).to eq true
  			end
  		end

  		context " Prueba del modulo Enumerable para lista de platos segun valor energetico"do

  			it "Prueba del collect"do

				expect(@lista_platos_diferentes_dietas.collect { |i| i.valor_calorico_total}).to eq ([954.3,3473.2,1867.8,1633.4,838.4])
			end

			it "Prueba del select" do
				expect(@lista_platos_diferentes_dietas.select { |i| i < @nodo_dieta_vegetariana.value}). to eq ([@nodo_dieta_española.value,@nodo_dieta_vegetaria.value,@nodo_dieta_vasca.value,@nodo_dieta_locura_por_carne.value])
			end

			it "Prueba del max"do
				expect(@lista_platos_diferentes_dietas.max). to eq @nodo_dieta_vegetariana.value
			end

			it "Prueba del min"do
				expect(@lista_platos_diferentes_dietas.min). to eq @nodo_dieta_locura_por_carne.value
			end

			it "Prueba de sort"do
				expect(@lista_platos_diferentes_dietas.sort).to eq ([@nodo_dieta_locura_por_carne.value,@nodo_dieta_española.value,@nodo_dieta_vasca.value,@nodo_dieta_vegetaria.value,@nodo_dieta_vegetariana.value])
			end

  		end

  	end


  	describe PlatoHuellaAmbiental do
  		before :all do
  			@carne_vaca = Alimento.new("carne de vaca",50.0,164.0,21.1,0.0,3.1,"hombre",100)
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

  			@lista_platos_diferentes_dietass = Lista.new
  			
  			@plato_tradicional_huella_ambiental = PlatoHuellaAmbiental.new("plato tradicional",@lista_alimentos_plato,@acc_cantidad_alimentos)

  			@salmonito = Alimento.new("salmon",6.0,3.7,19.9,0.0,13.6,"hombre",100)

  			@nuecito = Alimento.new("nuez",0.3,7.9,20.0,21.0,54.0,"hombre",100)

  			@tofito = Alimento.new("tofu",2.9,2.2,8.0,1.9,4.8,"hombre",100)

  			@camaronito = Alimento.new("camarones",18.0,2.0,17.6,1.5,0.6,"hombre",100)

  			@nodo_salmonito = Nodo.new(@salmonito,nil,nil)
  			@nodo_nuecito = Nodo.new(@nuecito,nil,nil)
  			@nodo_tofito= Nodo.new(@tofito,nil,nil)
  			@nodo_camaronito = Nodo.new(@camaronito,nil,nil)

  			@lista_alimentos_dieta_orientall = Lista.new

  			@lista_alimentos_dieta_orientall.push_tail(@nodo_salmonito)
  			@lista_alimentos_dieta_orientall.push_tail(@nodo_nuecito)
  			@lista_alimentos_dieta_orientall.push_tail(@nodo_tofito)
  			@lista_alimentos_dieta_orientall.push_tail(@nodo_camaronito)

  			@acc_cantidad_alimentoss2 = 0

  			@plato_dieta_orientall = PlatoHuellaAmbiental.new("plato dieta oriental",@lista_alimentos_dieta_orientall,@acc_cantidad_alimentoss2)

  			@salmonito_2 = @salmonito * 2
  			@nuecito_2 = @nuecito * 2
  			@tofito_2 = @tofito * 2
  			@camaronito_2 = @camaronito * 2

  			@nodo_salmonito_2 = Nodo.new(@salmonito_2,nil,nil)
  			@nodo_nuecito_2 = Nodo.new(@nuecito_2,nil,nil)
  			@nodo_tofito_2 = Nodo.new(@tofito_2,nil,nil)
  			@nodo_camaronito_2 = Nodo.new(@camaronito,nil,nil)

  			@lista_dieta_orientall_fuerte = Lista.new

  			@lista_dieta_orientall_fuerte.push_tail(@nodo_salmonito_2)
  			@lista_dieta_orientall_fuerte.push_tail(@nodo_nuecito_2)
  			@lista_dieta_orientall_fuerte.push_tail(@nodo_tofito_2)
  			@lista_dieta_orientall_fuerte.push_tail(@nodo_camaronito_2)

  			@acc_cantidad_alimentoss3 = 0


  			@plato_dieta_orientall_fuerte = PlatoHuellaAmbiental.new("plato dieta oriental doble racion", @lista_dieta_orientall_fuerte,@acc_cantidad_alimentoss3)

  			@carne_vaca2 = Alimento.new("carne de vaca",50,164.0,21.1,0.0,3.1,"hombre",100)
  			@carne_vaca3 = Alimento.new("carne de vaca",50,164.0,21.1,0.0,3.1,"hombre",100)
  			@huevos2 = Alimento.new("huevos",4.2,5.7,13.0,1.1,11.0,"hombre",100)
  			@lentejas2 = Alimento.new("lentejas",0.4,3.4,23.5,52.0,1.4,"hombre",100)
  			@leche_de_vaca = Alimento.new("leche vaca",3.2,8.9,3.3,4.8,3.2,"hombre",100)

  			@nodo_carne_vaca2 = Nodo.new(@carne_vaca2,nil,nil)
  			@nodo_carne_vaca3 = Nodo.new(@carne_vaca2,nil,nil)
  			@nodo_huevos_2 = Nodo.new(@huevos2 * 3,nil,nil)
  			@nodo_lentejas_2 = Nodo.new(@lentejas2,nil,nil)
  			@nodo_leche_vaca_2 = Nodo.new(@leche_de_vaca,nil,nil)

  			@lista_dieta_espaniola = Lista.new

  			@lista_dieta_espaniola.push_tail(@nodo_carne_vaca2)
  			@lista_dieta_espaniola.push_tail(@nodo_huevos_2)
  			@lista_dieta_espaniola.push_tail(@nodo_lentejas_2)
  			@lista_dieta_espaniola.push_tail(@nodo_leche_vaca_2)

  			acc_cantidad_alimentos_dieta_espaniola = 0

  			@plato_dieta_espaniola = PlatoHuellaAmbiental.new("plato dieta española",@lista_dieta_espaniola,acc_cantidad_alimentos_dieta_espaniola)


  			@carne_cordero2 = Alimento.new("carne cordero",20.0,185.0,18.0,0.0,17.0, "hombre",100)
  			@carne_cordero3 = Alimento.new("carne cordero",20.0,185.0,18.0,0.0,17.0, "hombre",100)
  			@chocolate2 = Alimento.new("chocolate",2.3,3.4,5.3,47.0,30.0,"hombre",100)
  			@queso = Alimento.new("queso",11.0,41.0,25.0,1.3,33.0,"hombre",100)
  			@salmonillo = Alimento.new("salmon",6.0,3.7,19.9,0.0,6.6,"hombre",100)
  			@nuecillo = Alimento.new("nuez",0.3,7.9,20.0,21.0,54.0,"hombre",100)

  			@tofillo = Alimento.new("tofu",2.0,2.2,8.0,1.9,4.8,"hombre",100)

  			@camarones_de_dakhla = Alimento.new("camarones",18.0,2.0,17.6,1.5,0.6,"hombre",100)

  			@camarones_de_dakhla2 = Alimento.new("camarones",18.0,2.0,17.6,1.5,0.6,"hombre",100)

  			@nodo_carne_cordero = Nodo.new(@carne_cordero2 * 3,nil,nil)
  			@nodo_carne_cordero2 = Nodo.new(@carne_cordero3 * 2.5,nil,nil)
  			@nodo_chocolate = Nodo.new(@chocolate2 * 2,nil,nil)
  			@nodo_queso = Nodo.new(@queso,nil,nil)
  			@nodo_tofillo = Nodo.new(@tofillo * 2,nil,nil)
  			@nodo_nuecillo = Nodo.new(@nuecillo * 2,nil,nil)
  			@nodo_camarones_dakhla = Nodo.new(@camarones_de_dakhla,nil,nil)
  			@nodo_camarones_dakhla2 = Nodo.new(@camarones_de_dakhla2,nil,nil)
  			@lista_dieta_vasca = Lista.new

  			@lista_dieta_vasca.push_tail(@nodo_carne_cordero)
  			@lista_dieta_vasca.push_tail(@nodo_chocolate)

  			acc_cantidad_alimentos_vasca = 0

  			@plato_dieta_vasca = PlatoHuellaAmbiental.new(" plato dieta vasca",@lista_dieta_vasca,acc_cantidad_alimentos_vasca)

  			@lista_dieta_vegetaria = Lista.new

  			@lista_dieta_vegetaria.push_tail(@nodo_tofillo)
  			@lista_dieta_vegetaria.push_tail(@nodo_nuecillo)
  			@lista_dieta_vegetaria.push_tail(@nodo_queso)

  			@acc_cantidad_alimentos_vegetaria  = 0

  			@plato_dieta_vegetaria = PlatoHuellaAmbiental.new(" plato dieta vegetaria",@lista_dieta_vegetaria,@acc_cantidad_alimentos_vegetaria)

  			@lista_dieta_locura_carne = Lista.new

  			@lista_dieta_locura_carne.push_tail(@nodo_carne_vaca3)
  			@lista_dieta_locura_carne.push_tail(@nodo_carne_cordero2)
  			@lista_dieta_locura_carne.push_tail(@nodo_camarones_dakhla)
  			@lista_dieta_locura_carne.push_tail(@nodo_camarones_dakhla2)

  			@acc_cantidad_locura_por_carne = 0

  			@plato_dieta_locura_por_carne = PlatoHuellaAmbiental.new( "plato dieta locura por la carne",@lista_dieta_locura_carne,@acc_cantidad_locura_por_carne)

  			@quesesillo = Alimento.new("queso",11.0,41.0,25.0,1.3,33.0,"hombre",100)
  			@salmonillo = Alimento.new("salmon",6.0,3.7,19.9,0.0,6.6,"hombre",100)
  			@nuececillo = Alimento.new("nuez",0.3,7.9,20.0,21.0,54.0,"hombre",100)

  			@tofefillo = Alimento.new("tofu",2.0,2.2,8.0,1.9,4.8,"hombre",100)

  			@nodo_quesesillo = Nodo.new(@carne_cordero2 * 3,nil,nil)
  			@nodo_salmooon = Nodo.new(@carne_cordero3,nil,nil)
  			@nodo_nuecillo = Nodo.new(@chocolate2 * 5,nil,nil)
  			@nodo_tofefillo = Nodo.new(@queso,nil,nil)

  			@lista_dieta_vegetariana = Lista.new

  			@lista_dieta_vegetariana.push_tail(@nodo_quesesillo)
  			@lista_dieta_vegetariana.push_tail(@nodo_nuecillo)
  			@lista_dieta_vegetariana.push_tail(@nodo_tofefillo)

  			@acc_cantidad_alimentos_vegetariana = 0


  			@plato_dieta_vegetariana = PlatoHuellaAmbiental.new("plato dieta vegetariana",@lista_dieta_vegetariana,@acc_cantidad_alimentos_vegetariana)

  			puts  "valor energetico dieta española " + @plato_dieta_espaniola.emisiones_gei.to_s

  			puts  "valor energetico dieta vegetariana " + @plato_dieta_vegetariana.emisiones_gei.to_s

  			puts "valor energetico dieta vegetaria " + @plato_dieta_vegetaria.emisiones_gei.to_s

  			puts "valor energetico dieta vasca " + @plato_dieta_vasca.emisiones_gei.to_s

  			puts "valor energetico dieta locura carne " + @plato_dieta_locura_por_carne.emisiones_gei.to_s

  			@lista_platos_diferentes_dietas = Lista.new

  			@nodo_dieta_española = Nodo.new(@plato_dieta_espaniola,nil,nil)
  			@nodo_dieta_vegetariana = Nodo.new(@plato_dieta_vegetariana,nil,nil)

  			@nodo_dieta_vegetaria = Nodo.new(@plato_dieta_vegetaria,nil,nil)
  			@nodo_dieta_vasca = Nodo.new(@plato_dieta_vasca,nil,nil)

  			@nodo_dieta_locura_por_carne = Nodo.new(@plato_dieta_locura_por_carne,nil,nil)

  			@lista_platos_diferentes_dietass.push_tail(@nodo_dieta_española)
  			@lista_platos_diferentes_dietass.push_tail(@nodo_dieta_vegetariana)
  			@lista_platos_diferentes_dietass.push_tail(@nodo_dieta_vegetaria)
  			@lista_platos_diferentes_dietass.push_tail(@nodo_dieta_vasca)
  			@lista_platos_diferentes_dietass.push_tail(@nodo_dieta_locura_por_carne)


  		end

  		context "Pruebas clase,tipo y jerarquia de la clase PlatoHuellaAmbiental"do

  			it "Pruebas de tipo"do
  				expect(@plato_tradicional_huella_ambiental.instance_of?PlatoHuellaAmbiental).to eq true
  			end

  			it "Pruebas de jerarquía del objeto"do
  				expect(@plato_tradicional_huella_ambiental.is_a? PlatoHuellaNutricional).to eq true
  			end

  			it "Pruebas de jerarquía "do
  				expect(@plato_tradicional_huella_ambiental.class).to eq PlatoHuellaAmbiental
  			end
  		end

  		context "Pruebas de getter de la eficiencia del plato"do

  			it " Debe existir el nombre del plato "do
  				expect(@plato_tradicional_huella_ambiental.instance_variable_defined?(:@nombre)).to eq true
  			end

  			it " Debe existir la lista de alimentos "do
  				expect(@plato_tradicional_huella_ambiental.instance_variable_defined?(:@lista_alimentos)).to eq true
  			end

  			it " Debe existir la cantidad total de alimentos en el plato "do
  				expect(@plato_tradicional_huella_ambiental.instance_variable_defined?(:@acc_cantidad_alimentos)).to eq true
  			end
  		end

  		context "Pruebas de los metodos de la clase hija "do
  			it " Debe existir metodo que devuelve valor total de la emisiones diarias gei"do
  				expect(@plato_tradicional_huella_ambiental.respond_to?("emisiones_gei")).to eq true
  				expect(@plato_tradicional_huella_ambiental.emisiones_gei).to eq 54.6
  			end

  			it " Debe existir metodo que devuelve valor total del area de terreno utilizada para producir los alimentos del plato"do
  				expect(@plato_tradicional_huella_ambiental.respond_to?("area_terreno")).to eq true
  				expect(@plato_tradicional_huella_ambiental.area_terreno).to eq 173.1
  			end

  			it " Se debe poder obtener la salida formateada de la eficiencia energetica del plato "do
  				expect(@plato_tradicional_huella_ambiental.to_s).to eq  @plato_tradicional_huella_ambiental.parent_to_s + "\n\n" + 
  				"Emisiones de gases en kg CO2 " + @plato_tradicional_huella_ambiental.emisiones_gei.to_s + "\n" + "Cantidad de terreno empleado en m2 " + @plato_tradicional_huella_ambiental.area_terreno.to_s + "\n"
  			end

  		end

  		context " Pruebas del modulo Comparable en la clase plato hija"do

  			it " Debe existir el comparable < "do
  				expect(@plato_tradicional_huella_ambiental > @plato_dieta_orientall).to eq true
  			end

  			it " Debe existir el comparable >"do
  				expect(@plato_tradicional_huella_ambiental < @plato_dieta_orientall).to eq false
  			end

  			it " Debe existir  el comparable <= "do
  				expect(@plato_tradicional_huella_ambiental >= @plato_dieta_orientall).to eq true
  			end

  			it "Debe existir el comparable >="do
  				expect(@plato_tradicional_huella_ambiental <= @plato_dieta_orientall).to eq false
  			end

  			it "Debe existir el comparable between"do

  				expect(@plato_dieta_orientall_fuerte.between?(@plato_dieta_orientall,@plato_tradicional_huella_ambiental)).to eq true
  			end
  		end

  		context " Prueba del modulo Enumerable para lista de platos segun gases efecto invernadero"do

  			it "Prueba del collect"do

				expect(@lista_platos_diferentes_dietass.collect { |i| i.emisiones_gei}).to eq ([66.2,82.5,15.6,64.6,136.0])
			end

			it "Prueba del select" do
				expect(@lista_platos_diferentes_dietass.select { |i| i < @nodo_dieta_vegetariana.value}). to eq ([@nodo_dieta_española.value,@nodo_dieta_vegetaria.value,@nodo_dieta_vasca.value])
			end

			it "Prueba del max"do
				expect(@lista_platos_diferentes_dietass.max). to eq @nodo_dieta_locura_por_carne.value
			end

			it "Prueba del min"do
				expect(@lista_platos_diferentes_dietass.min). to eq @nodo_dieta_vegetaria.value
			end

			it "Prueba de sort"do
				puts @nodo_dieta
				expect(@lista_platos_diferentes_dietass.sort).to eq ([@nodo_dieta_vegetaria.value,@nodo_dieta_vasca.value,@nodo_dieta_española.value,@nodo_dieta_vegetariana.value,@nodo_dieta_locura_por_carne.value])
			end

  		end
  	end

end

RSpec.describe "Pruebas programación funcional gema Huella Nutricional"do

	before	:all do

		@menu1 = []

		@lista_plato_entrante = Lista.new

		

		@alimento1 = Alimento.new("carne de vaca",50.0,164.0,21.1,0.0,3.1,"hombre",100)
		@alimento2 = Alimento.new("pollo",5.7,7.1,20.6,0.0,5.6,"hombre",100)
		@alimento3 = Alimento.new("chocolate",2.3,3.4,5.3,47.0,30.0,"hombre", 100)

		@nodo1 = Nodo.new(@alimento1,nil,nil)
		@nodo2 = Nodo.new(@alimento2,nil,nil)
		@nodo3 = Nodo.new(@alimento3,nil,nil)

		@lista_plato_entrante.push_tail(@nodo1)
		@lista_plato_entrante.push_tail(@nodo2)
		@lista_plato_entrante.push_tail(@nodo3)

		@acc_cantidad_alimentos1 = 0

		@plato_entrante = PlatoHuellaAmbiental.new("plato entrante",@lista_plato_entrante,@acc_cantidad_alimentos1)


		@lista_plato_primero = Lista.new

		@alimento4 = Alimento.new("lentejas",0.4,3.4,23.5,52.0,1.4,"hombre",100)
		@alimento5 = Alimento.new("nuez",0.3,7.9,20.0,21.0,54.0,"hombre",100)
		@alimento6 = Alimento.new("camarones(piscifactoria)",18.0,2.0,17.6,1.5,0.6,"hombre",100)

		@nodo4 = Nodo.new(@alimento4,nil,nil)
		@nodo5 = Nodo.new(@alimento5,nil,nil)
		@nodo6 = Nodo.new(@alimento6,nil,nil)

		@lista_plato_primero.push_tail(@nodo4)
		@lista_plato_primero.push_tail(@nodo5)
		@lista_plato_primero.push_tail(@nodo6)

		@acc_cantidad_alimentos2 = 0

		@plato_primero = PlatoHuellaAmbiental.new("plato primero",@lista_plato_primero,@acc_cantidad_alimentos2)


		@lista_plato_segundo = Lista.new

		@alimento6 = Alimento.new("carne de cordero",20.0,185.0,18.0,0.0,17.0,"hombre",100)
		@alimento7 = Alimento.new("tofu",2.0,2.2,8.0,1.9,4.8,"hombre",100)
		@alimento8 = Alimento.new("salmon(piscifactoria)",6.0,3.7,19.9,0.0,13.6,"hombre",100)

		@nodo6 = Nodo.new(@alimento6,nil,nil)
		@nodo7 = Nodo.new(@alimento7,nil,nil)
		@nodo8 = Nodo.new(@alimento8,nil,nil)

		@lista_plato_segundo.push_tail(@nodo6)
		@lista_plato_segundo.push_tail(@nodo7)
		@lista_plato_segundo.push_tail(@nodo8)

		@acc_cantidad_alimentos3 = 0

		@plato_segundo = PlatoHuellaAmbiental.new("plato segundo",@lista_plato_segundo,@acc_cantidad_alimentos3)

		@menu1.push(@plato_entrante,@plato_primero,@plato_segundo)
	end

	describe "Calculando el indice de impacto de la energia y de la huella de carbono DEL PLATO"do
		it" debe existir el metodo que devuelve el indice de impacto de la energia del plato "do
			expect(@plato_entrante.respond_to?("indice_impacto_energia_plato")).to eq true

			expect(@plato_entrante.indice_impacto_energia_plato).to eq 3
		end

		it" debe existir el metodo que devuelve el indice de impacto de la huella de carbono del plato "do
			expect(@plato_entrante.respond_to?("indice_impacto_huella_carbono_plato")).to eq true

			expect(@plato_entrante.indice_impacto_huella_carbono_plato).to eq 3
		end
	end
end
