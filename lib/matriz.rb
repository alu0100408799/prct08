#Fichero para el desarrolo de la clase matriz

require 'matrix'

class Matrices
	
	attr_reader :mat, :col, :fil

	def initialize(matriz)
		@mat = matriz
		@col = matriz[0].size 
		@fil = matriz.size	
	end

	def +(other)
		i = 0
                j = 0
                sum = @mat
                while i < @fil                   
                   while j < @col
                        sum[i,j] = sum[i,j] + other.mat[i,j]
                        j += 1
                   end
                   i += 1
                   j = 0
                end
                return sum
        end
end
