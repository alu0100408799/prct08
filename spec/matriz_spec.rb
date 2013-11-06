#Fichero para definir las expectativas

require "matriz.rb"

describe Matrices do

	before :each do
		@mat1 = Matrices.new([[0,0],[0,0]])
		@mat2 = Matrices.new([[1,1],[1,1],[1,1]])
		@mat3 = Matrices.new([[1,1],[1,1]])
		@mat4 = Matrices.new([[2,2],[2,2]])
		@mat5 = Matrices.new([[3,3],[3,3]])
	end

	describe "# Crear y rellenar la matriz" do
		it "Tiene que tener filas" do 
			(defined?(@mat1.fil)).should be_true
			@mat1.fil.should eq(2)
			(defined?(@mat2.fil)).should be_true
			@mat2.fil.should eq(3)
	
		end

		it "Tiene que tener columnas" do
			(defined?(@mat1.col)).should be_true
			@mat1.col.should eq(2)
			
			(defined?(@mat2.col)).should be_true
			@mat2.col.should eq(2)
		end
	end
	
	describe "# Operaciones sobre matrices" do
		it "Hay que realizar la suma sobre las matrices" do
			(@mat3 + @mat4).should eq(@mat5)
		end
	end
end