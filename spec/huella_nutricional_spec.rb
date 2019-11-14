RSpec.describe HuellaNutricional do
  it "has a version number" do
    expect(HuellaNutricional::VERSION).not_to be nil
  end

  describe Alimento do
  	before :all do
  		@carne_vaca = Alimento.new("carne de vaca",50.0,164.0,21.1,0.0,3.1,"hombre")
	end

	context "Probando los getters y el to_s" do
		it "Se ha de poder instanciar un alimento"do
			expect(@carne_vaca.nombre).to eq("carne de vaca")
		end

		it "Se ha de poder instanciar los gases de efecto invernadero"do
			expect(@carne_vaca.respond_to?("kg_gei")).to eq(true)
		end

		it"Se ha de poder instanciar los metros cuadrados de terreno"do
			expect(@carne_vaca.respond_to?("area_terreno")).to eq(true)
		end

		it"Se han de poder instanciar las proteinas"do
			expect(@carne_vaca.respond_to?("proteinas")).to eq(true)
		end
	end
  end

end
