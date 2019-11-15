RSpec.describe HuellaNutricional do
  it "has a version number" do
    expect(HuellaNutricional::VERSION).not_to be nil
  end

  describe Alimento do
  	before :all do
  		@carne_vaca = Alimento.new("carne de vaca",50.0,164.0,21.1,0.0,3.1,"hombre",100)
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
			expect(@carne_vaca.valor_energetico_alimento).to eq(202.3)
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

  end

end
