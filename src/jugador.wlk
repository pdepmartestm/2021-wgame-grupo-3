import wollok.game.*
import juego.*

object jugador {

	var position = game.center()
	var facing = "down"
	
	method position() {
		return position
	}

	method image() {
		return "player-"+facing+".png"
	}
	
	
	//Metodos de movimiento
	method moverseDerecha(){
		facing = "right"
		position = juego.queNoSeSalga(position.right(1))
	}
	method moverseIzquierda(){
		facing = "left"
		position = juego.queNoSeSalga(position.left(1))
	}
	method moverseArriba(){
		facing = "up"
		position = juego.queNoSeSalga(position.up(1))
	}
		method moverseAbajo(){
		facing = "down"
		position = juego.queNoSeSalga(position.down(1))
	}

	method poder(){
		return poder
	}
	
	method decir(msg){
		game.say(self, msg)
	}
}
