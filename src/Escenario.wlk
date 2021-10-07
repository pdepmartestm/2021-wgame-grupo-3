import wollok.game.*
import player.*
import juego.*

class Escenario {
	var property objets = new List()
	var property background
	var property codigo
		
}

class Element {
	var property image
	var property position
	
	method position(){
		return position
	}
	
	method image(){
		return image
	}
	
	method collision(){
	}
}

class PickUp inherits Element {
	
	override method collision(){
		player.pickUp(self)
	}
}

object door inherits Element(image = "closedDoor2.png",position = game.at(8,10)){
	
	override method collision(){
		image = "openDoor2.png"
	}
	
}

const key = new PickUp(image = "key.png",position = game.at(05,05)) //No estoy muy seguro como implementarlo
	
	
