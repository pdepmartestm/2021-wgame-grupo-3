class Digito {
	var contador
	var image="assets/numeros/"+contador.toString()+".jpg"
	var property position
	var property time
	var property limit = 9
	
	method image(){
		return image
	}
	
	method cambia (){
		if (contador==0)
			contador = limit
		else
			contador -= 1
			
	    image="assets/numeros/"+contador.toString()+".jpg"
	}
}
	