class Individuo
    attr_accessor :nombre,:edad,:sexo
    
    def initialize(nombre,edad,sexo)
        @edad = edad
        @sexo = sexo
        @nombre = nombre
    end
    
    def to_s()
        return "Nombre :#{@nombre}, Edad #{@edad}, Sexo #{@sexo}"
    end
end  
    
    class Paciente < Individuo
       attr_accessor :nombre,:edad,:sexo,:peso,:talla,:porcentaje,:imc,:valor
       
       def initialize(nombre,peso,talla,edad,sexo,porcentaje,imc,valor)
           super(nombre,edad,sexo)
           @nombre = nombre
           @edad = edad
           @sexo = sexo
           @peso = peso
           @talla = talla
           @porcentaje = porcentaje
           @imc = imc
           @valor = valor
       end
       
       def calculateimc
           @imc = peso/(talla*talla)
           return @imc
       end
       
       def calculatePorcentaje
           if sexo == "Hombre"
               sexo = 1
           else
               sexo = 0
           end
           
           porcentaje = 1.2 * @imc + 0.23 * edad - 10.8 * sexo - 5.4
           
           if @imc < 18.5
               @valor = 'flaco'
           else if @imc < 24.9
               @valor = 'medio'
           else
               @valor = 'obeso'
           end
       end
       return porcentaje
       end
       
       def to_s()
           return "Nombre: #{@nombre}, Peso: #{@peso}, Talla: #{@talla}, Edad: #{@edad}, Sexo: #{@sexo}, IMC: #{@imc}, Porcentaje: #{@porcentaje}, Complexión: #{@valor}"
       end
        
end
    