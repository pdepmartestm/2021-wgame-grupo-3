import wollok.game.*
import juego.*

object player {
	
	const inventory = []
	var position = game.center()
	var lastPosition = game.center()
	var facing = "down"
	
	method position() {
		return position
	}
	
	method lastPosition(){
		return lastPosition
	}

	method image() {
		return "player-"+facing+".png"
	}
	
	
	//Metodos de movimiento
	method moveRight(){
		facing = "right"
		lastPosition = position
		position = juego.queNoSeSalga(position.right(1),lastPosition)
	}
	method moveLeft(){
		facing = "left"
		lastPosition = position
		position = juego.queNoSeSalga(position.left(1),lastPosition)
	}
	method moveUp(){
		facing = "up"
		lastPosition = position
		position = juego.queNoSeSalga(position.up(1),lastPosition)
	}
	method moveDown(){
		facing = "down"
		lastPosition = position
		position = juego.queNoSeSalga(position.down(1),lastPosition)
	}

	method poder(){
		//return poder
	}
	
	method decir(msg){
		game.say(self, msg)
	}
	method pickUp(thing){
		inventory.add(thing)
	}
	
	method have(thing){
		return inventory.contains(thing)
	}
	
	method inventory(){
		return inventory
	}
	
}
