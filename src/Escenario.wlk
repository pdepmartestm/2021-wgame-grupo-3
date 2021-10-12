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
		self.changePosition(2+player.inventory().size(),0)
	}
	method changePosition(x,y){
		position = game.at(x,y)
	}
}


object door inherits Element(image = "closedDoor2.png",position = game.at(8,9)){
	
	//Tener en cuenta que la verdadera posicion de la puerta 
	//es una posicion mas abajo de la imgagen
	
	override method collision(){
		if(player.have(key)){
			//desbloquear siguiente nivel
			player.inventory().remove(key)
			game.removeVisual(key)
			image = "openDoor2.png"
			
		}
	}
	
}


	

