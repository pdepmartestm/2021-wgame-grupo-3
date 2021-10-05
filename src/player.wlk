import wollok.game.*
import juego.*

object player {
	
	const inventory = []
	var position = game.center()
	var facing = "down"
	
	method position() {
		return position
	}

	method image() {
		return "player-"+facing+".png"
	}
	
	
	//Metodos de movimiento
	method moveRight(){
		facing = "right"
		position = juego.queNoSeSalga(position.right(1))
	}
	method moveLeft(){
		facing = "left"
		position = juego.queNoSeSalga(position.left(1))
	}
	method moveUp(){
		facing = "up"
		position = juego.queNoSeSalga(position.up(1))
	}
		method moveDown(){
		facing = "down"
		position = juego.queNoSeSalga(position.down(1))
	}

	method poder(){
		return poder
	}
	
	method decir(msg){
		game.say(self, msg)
	}
	method pickUp(thing){
		inventory.Add(thing)
	}
	
}
