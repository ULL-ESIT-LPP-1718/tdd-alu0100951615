require "spec_helper"
require 'benchmark'

RSpec.describe DLL do
    before :each do
   
    @valor1 = 1
    @valor2 = 5
    @valor3 = 10
    @valor4 = 20
    @valor5 = 50
    @etiqueta1 = Info_nutri.new("Lechuga",1000,5.5,0.5,2,3.5,0.7,@valor1,1.6,2.7,4.8,9,2.3,3.7,2,500)
    @etiqueta2 = Info_nutri.new("Almendras",1000,5.5,0.5,2,3.5,0.7,@valor2,1.6,2.7,4.8,9,2.3,3.7,2,500)
    @etiqueta3 = Info_nutri.new("Pollo",1000,5.5,0.5,2,3.5,0.7,@valor3,1.6,2.7,4.8,9,2.3,3.7,2,500)
    @etiqueta4 = Info_nutri.new("Papas Fritas",1000,5.5,0.5,2,3.5,0.7,@valor4,1.6,2.7,4.8,9,2.3,3.7,2,500)
    @etiqueta5 = Info_nutri.new("Bacalao",1000,5.5,0.5,2,3.5,0.7,@valor5,1.6,2.7,4.8,9,2.3,3.7,2,500)
    
    @dll1 = DLL.new(@etiqueta1)
    
    
    @dll2 = DLL.new(@etiqueta1)
    @dll2.insert_tail(@etiqueta2)
    @dll2.insert_tail(@etiqueta3)
    @dll2.insert_tail(@etiqueta4)
    @dll2.insert_tail(@etiqueta5)
    
    @paciente1 = Paciente.new("Daniel",80, 2.50, 25,"Hombre",nil, nil, nil)
    @paciente2 = Paciente.new("Martín",85, 1.50, 20,"Hombre",nil, nil, nil)
    @paciente3 = Paciente.new("Alejandro",50, 1.70, 15,"Hombre",nil, nil, nil)
    @paciente4 = Paciente.new("Catalina",60, 1.80, 10,"Mujer",nil, nil, nil)
    @paciente5 = Paciente.new("Carla",70, 1.90, 14,"Mujer",nil, nil, nil)
    @dll3 = DLL.new(@paciente1)
    @dll3.insert_tail(@paciente2)
    @dll3.insert_tail(@paciente3)
    @dll3.insert_tail(@paciente4)
    @dll3.insert_tail(@paciente5)
    
    
    
    
    #Tests para practica 9
    @value1 = 25
    @value2 = 21
    @value3 = 3
    @value4 = 18
  	@value5 = 9
    @prueba1 = Info_nutri.new("Hamburguesa",5000,9.5,0.6,5,3.5,0.7,@value1,4,2.7,1.6,7,2.3,5.3,7,500)
    @prueba2 = Info_nutri.new("Perrito",1000,5.5,0.5,2,3.5,0.7,@value2,1.6,2.7,4.8,9,2.3,3.7,2,500)
    @prueba3 = Info_nutri.new("Flan",1000,5.5,0.5,2,3.5,0.7,@value3,1.6,2.7,4.8,9,2.3,3.7,2,500)
    @prueba4 = Info_nutri.new("Pizza",5000,9.5,0.6,5,3.5,0.7,@value4,4,2.7,1.6,7,2.3,5.3,7,500)
    @prueba5 = Info_nutri.new("Helado",1000,5.5,0.5,2,3.5,0.7,@value5,1.6,2.7,4.8,9,2.3,3.7,2,500)
    @lista = DLL.new(@prueba1)
    @lista.insert_tail(@prueba2)
    @lista.insert_tail(@prueba3)
    @lista.insert_tail(@prueba4)
    @lista.insert_tail(@prueba5)
    	
    @persona1 = Paciente.new("Martín",80, 2.50, 25,"Hombre",nil, nil, nil)
    @persona2 = Paciente.new("Lucía", 85, 1.70, 20, "Mujer", nil, nil, nil)
    @persona3 = Paciente.new("Alejandro", 75, 1.20, 16, "Hombre", nil, nil, nil)
    @persona4 = Paciente.new("Daniel", 115, 1.10, 20, "Hombre", nil, nil, nil)
    @persona5 = Paciente.new("Eduardo", 70, 1.78, 14, "Hombre", nil, nil, nil)
    @lista2 = DLL.new(@persona1)
    @lista2.insert_tail(@persona2)
    @lista2.insert_tail(@persona3)
    @lista2.insert_tail(@persona4)
    @lista2.insert_tail(@persona5)
    
    
    
    
    
    
    
  end
  
    describe "Pruebas de la creación" do
    it "Se ha creado bien la lista" do
      expect(@dll1).not_to eq(nil)
    end
    
    it "Se ha introducido bien el head_" do
      expect(@dll1.head).not_to eq(nil)
    end
    
    it "Se ha introducido bien la cola" do
      expect(@dll1.tail).not_to eq(nil)
    end
    end
    context "Metodos de la lista " do
    it "Insertar nodo en head_" do
      @dll1.insert_head(@etiqueta2)
      expect(@dll1.head.value.getSal).to eq(@valor2)
    end
    
    it "Insertar nodo en tail " do
      @dll1.insert_tail(@etiqueta3)
      expect(@dll1.tail.value.getSal).to eq(@valor3)
    end
    
    it "Extraer nodo en head_" do
      @dll1.insert_head(@etiqueta4)
      expect(@dll1.extract_head).to eq(@etiqueta4)
    end
    
    it "Extraer nodo en tail_" do
      @dll1.insert_tail(@etiqueta5)
      expect(@dll1.extract_tail).to eq(@etiqueta5)
    end
    
    it "Se imprime correctamente la clase con los gramos de Sal" do
      @dll1.insert_tail(@etiqueta2)
      @dll1.insert_tail(@etiqueta3)
      @dll1.insert_tail(@etiqueta4)
      @dll1.insert_tail(@etiqueta5)
      @dll1.insert_tail(@etiqueta1)
      expect(@dll1.to_s).to eq("(1 gr,5 gr,10 gr,20 gr,50 gr,1 gr,)")
    end
  end
  context "Clasificación según gramos de Sal" do
    it "Se imprime bien la clasificación por gramos de sal" do
      @dll1.insert_tail(@etiqueta2)
      @dll1.insert_tail(@etiqueta3)
      @dll1.insert_tail(@etiqueta4)
      @dll1.insert_tail(@etiqueta5)
      @dll1.insert_tail(@etiqueta1)
      expect(@dll1.clasificacion).to eq(["Almendras, Medio en Sal", 
      "Bacalao, Alto en Sal", "Lechuga, Bajo en Sal", "Lechuga, Bajo en Sal", 
      "Papas Fritas, Medio en Sal", "Pollo, Medio en Sal"])
    end
  end
  
  context "#Comprobando lista de humanos" do
    it "Clasificacion de IMC" do
        @persona1 = Paciente.new("Daniel",50,1.50,70,"Hombre",nil,nil,nil);
        @persona2 = Paciente.new("Sheila",70,1.70,60,"Mujer",nil,nil,nil);
        @persona3 = Paciente.new("Miguel",100,1.90,80,"Hombre",nil,nil,nil);
        @persona4 = Paciente.new("Pablo",80,1.70,120,"Hombre",nil,nil,nil);
        @persona5 = Paciente.new("Paula",60,1.80,15,"Mujer",nil,nil,nil);
        @lista = DLL.new(@persona1)
        @lista.insert_tail(@persona2)
        @lista.insert_tail(@persona3)
        @lista.insert_tail(@persona4)
        @lista.insert_tail(@persona5)
      
      expect(@lista.clasificacionImc).to eq(["Daniel, medio", "Miguel, obeso", "Pablo, obeso", "Paula, medio", "Sheila, medio"])
    end
  end
  
  context "#Pruebas de la lista del modulo enumerable en la clase Nutrientes" do
	    it "Máximo valor" do
	    	expect(@lista.max).to eq(@prueba4)
	    end
	    
	    it "Mínimo valor" do
	    	expect(@lista.min).to eq(@prueba3)
	    end
	    
	    it "Collect" do
	    	expect(@lista.collect{"vale"}).to eq(["vale", "vale", "vale", "vale", "vale"])
	    end
	    
	    it "Select" do
	    	expect(@lista.select{|num| num < @prueba5}).to eq([@prueba1,@prueba3])
	    end
	    
	    it "Sort" do
	    	expect(@lista.sort).to eq([@prueba3, @prueba1, @prueba5, @prueba2, @prueba4])
	    end
	end
	
	context "#Pruebas de la lista del modulo enumerable en la clase Persona" do
	    it "Máximo valor" do
	    	expect(@lista2.max).to eq(@persona1)
	    end
	    
	    it "Mínimo valor" do
	    	expect(@lista2.min).to eq(@persona3)
	    end
	    
	    it "Collect" do
	    	expect(@lista2.collect{"vale"}).to eq(["vale", "vale", "vale", "vale", "vale"])
	    end
	    
	    it "Select" do
	    	expect(@lista2.select{|num| num < @persona5}).to eq([@persona3,@persona4])
	    end
	    
	    it "Sort" do
	    	expect(@lista2.sort).to eq([@persona3, @persona4, @persona5, @persona2, @persona1])
	    end
	end
  
end