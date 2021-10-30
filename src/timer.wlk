import wollok.game.*
import player.*

class MyTimer {
	var property contador
	const digito1 = new Digito(image = "assets/numeros/0.jpg",position = game.at(7,12), numero = 0)
	const digito2 = new Digito(image = "assets/numeros/0.jpg",position = game.at(8,12), numero = 0)
	const digito3 = new Digito(image = "assets/numeros/0.jpg",position = game.at(9,12), numero = 0)

	
	method cambia(){
		if (contador > 0){
			contador = contador - 1
			self.actualizarDigitos()	
		}
		else{
			game.say(player,"Perdi!")
			game.schedule(1000,{game.stop()})
		}
		
		
	}
	
	method initialize(){
		self.actualizarDigitos()
		game.addVisual(digito1)
		game.addVisual(digito2)
		game.addVisual(digito3)
	}
	
	method actualizarDigitos(){
		digito3.numero(contador % 10)
		digito2.numero(contador.div(10) % 10)
		digito1.numero(contador.div(100))
	}

}
	
class Digito{
	var property image
	var property numero
	var property position
	
	method image(){
		image="assets/numeros/"+numero.toString()+".jpg"
		return image
	}
}