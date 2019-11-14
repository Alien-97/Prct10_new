


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
			expect(@carne_vaca.kg_gei).to eq(50.0)
		end
	end
  end

end
