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
	var property walkable = true
	var property description
	
	method position(){
		return position
	}
	
	method image(){
		return image
	}
	
	method collision(){
		player.decir(description)
	}
	
}

class PickUp inherits Element {
	
	
	override method collision(){
		player.pickUp(self)
	}

}


/*object door inherits Element(image = "assets/closedDoor.png",position = game.at(8,10), description = "Una puerta cerrada", walkable = false){
	/* 
	override method interact(){
		if(player.have(key)){
			//desbloquear siguiente nivel
			player.inventory().remove(key)
			game.removeVisual(key)
			image = "assets/openDoor.png"
			description = "La puerta se ha abierto!"
			walkable = true
			
		}
		else {
			player.decir(description)
		}
	}
	
}*/

/*object box inherits Element(image = "assets/box1.png",position = game.at(5,6), description = "Una caja comun", walkable = false){
	
	
}*/
	
//Elementos de la habitacion
//const key = new PickUp(image = "assets/key.png",position = game.at(07,05), description = "Parece una llave de una puerta")

