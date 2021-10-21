import wollok.game.*
import player.*
import juego.*


class Escenario {
	var property objetos = new List()
	var property background
	var property codigo
	var property completado = false
	
	method inicializar(){
		game.clear()
		game.boardGround(background)
		//dibujar objetos
		objetos.forEach({x => game.addVisual(x)})
		game.schedule(2000,{juego.reproducirMusica()})
	}
		
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
	
	method interact(){
		player.decir(description)
	}
	
	method collision(){
		
	}
	
}

class PickUp inherits Element {
	
	
	override method collision(){
		player.pickUp(self)
	}

}


///-------------------- Nivel1 -------------------

	const box = new Element(image = "assets/box1.png",position = game.at(5,6), description = "Una caja común", walkable = false)
	//Elementos fijos de la habitación

	const key = new PickUp(image = "assets/key.png",position = game.at(07,05), description = "Parece una llave de una puerta")
	
	object door inherits Element(image = "assets/closedDoor.png", position = game.at(8,10), description = "Una puerta cerrada") {
		var open = false
	override method interact(){
			if(player.have(key)){
				//desbloquear siguiente nivel
				player.inventory().remove(key)
				game.removeVisual(key)
				image = "assets/openDoor.png"
				description = "La puerta se ha abierto!"
				open = true
				//Hacer un schedule aca para cambiar nivel
				//juego.cargarnivel2()
			}
			else {
				super()
			}
		}
	}
