class Digito {
	var contador
	var image="numeros/"+contador.toString()+".jpg"
	var property position
	var property desc
	var property time
	var property limit = 5
	
	method image(){
		return image
	}
	
	method cambia (){
		if (contador==0)
			contador = limit
		else
			contador -= 1
			
	    image="numeros/"+contador.toString()+".jpg"
	}
}
	