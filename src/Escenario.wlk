import wollok.game.*
import player.*
import juego.*
import nivel3.*


class Escenario {
	var property objetos = new List()
	var property background
	var property completado = false
	
	method inicializar(){
		game.clear()
		game.boardGround(background)
		//dibujar objetos
		objetos.forEach({x => game.addVisual(x)})
		//game.schedule(2000,{juego.reproducirMusica()})
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

	const box1 = new Element(image = "assets/box1.png",position = game.at(3,6), description = "Una caja común", walkable = false)
	const box2 = new Element(image = "assets/box1.png",position = game.at(8,3), description = "Una caja común", walkable = false)
	const box3 = new Element(image = "assets/box1.png",position = game.at(8,4), description = "Una caja común", walkable = false)
	const box4 = new Element(image = "assets/box1.png",position = game.at(10,4), description = "Una caja común", walkable = false)
	const box5 = new Element(image = "assets/box1.png",position = game.at(11,4), description = "Una caja común", walkable = false)
	const box6 = new Element(image = "assets/box1.png",position = game.at(12,4), description = "Una caja común", walkable = false)
	const box7 = new Element(image = "assets/box1.png",position = game.at(13,5), description = "Una caja común", walkable = false)
	const box8 = new Element(image = "assets/box1.png",position = game.at(14,5), description = "Una caja común", walkable = false)
	//Elementos fijos de la habitación

	const key = new PickUp(image = "assets/key.png",position = game.at(13,4), description = "Parece una llave de una puerta")
	
	object door inherits Element(image = "assets/closedDoor.png", position = game.at(8,10), description = "Una puerta cerrada") {

	override method interact(){
			if(player.have(key)){
				//desbloquear siguiente nivel
				player.inventory().remove(key)
				game.removeVisual(key)
				image = "assets/openDoor.png"
				description = "La puerta se ha abierto!"
				//Hacer un schedule aca para cambiar nivel
				game.schedule(1000,{juego.cargarNivel(1)})
				
			}
			else {
				super()
			}
		}
	}
	

	
