#! /usr/local/ruby/bin/ruby 

class Matriz

  attr_accessor :fila , :colum, :matriz

  def initialize (matriz)
    @fila = matriz.size
    @colum = matriz[0].size
    @matriz = matriz
  end

  def to_s
    mstring = ""
    for i in 0...@fila do
      for j in 0...@colum do
        mstring = mstring + @matriz[i][j].to_s + " "
      end
      mstring = mstring + "\n"
    end
    mstring
  end
  
  # Metodo para calcular el determinante de una matriz
  def det
    if (@fila == @colum)
    det = @matriz[0][0]
    aux = Matriz.new(@matriz)
    for k in 0...@fila do
      l = k+1
      for i in l...@colum do
        for j in l...@colum do
          aux.matriz[i][j] = (aux.matriz[k][k] * aux.matriz[i][j] - aux.matriz[k][j] * aux.matriz[i][k])/ aux.matriz[k][k]
        end
      end
      det = det * aux.matriz[k][k]
    end
    else
    det = "Imposible calcular l determinante, no se trata de una matriz cuadrada"
    end
    det
  end

  # Método apra calcular la traspuesta de una matriz
  def tras
    resultado = Array.new
      for i in 0...@fila do
        resultado[i] = Array.new
        for j in 0...@colum do
          resultado[i][j] = 0
        end
      end

    aux = Matriz.new(resultado)
    for i in 0...@fila do
      for j in 0...@colum do
        aux.matriz[i][j] = @matriz[j][i]
      end
    end
    aux
  end
  
  # Metodo para multiplicar una matriz por un escalar
  def x(escalar)
    aux = Matriz.new(@matriz)
    for i in 0...@fila do
      for j in 0...@colum do
        aux.matriz[i][j] = @matriz[i][j] * escalar
      end
    end
    aux
  end

  #Metodo para sumar dos matrices
  def +(mat)
    if (mat.fila == @fila && mat.colum == @colum)
      aux = Matriz.new(@matriz)
      for i in 0...@fila do
        for j in 0...@colum do
          aux.matriz[i][j] = @matriz[i][j] + mat.matriz[i][j]
        end
      end
    else
      aux = 0
    end
    aux
  end

  # Metodo para restar dos matrices
  def -(mat)
    if (mat.fila == @fila && mat.colum == @colum)
      aux = Matriz.new(@matriz)
      for i in 0...@fila do
        for j in 0...@colum do
          aux.matriz[i][j] = @matriz[i][j] - mat.matriz[i][j]
        end
      end
    else
      aux = 0
    end
    aux
  end

  # Metodo para multiplicar dos matrices
  def *(mat)
    if (@colum == mat.nFil)
      result = Array.new
      for i in 0...@fila do
        result[i] = Array.new
        for j in 0...mat.colum do
           result[i][j] = 0
        end
      end

      aux = Matriz.new(result)

      for i in 0...@fila do
        for j in 0...mat.colum do
          for z in 0...@colum do
            aux.matriz[i][j] += @matriz[i][z] * mat.matriz[z][j]
          end
        end
      end
    else
      aux = 0
    end
    aux
  end
end
