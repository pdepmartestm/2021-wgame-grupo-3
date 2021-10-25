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

	const box = new Element(image = "assets/box1.png",position = game.at(5,6), description = "Una caja común", walkable = false)
	//Elementos fijos de la habitación

	const key = new PickUp(image = "assets/key.png",position = game.at(07,05), description = "Parece una llave de una puerta")
	
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
	
	///-------------------- Nivel2 -------------------
	//Elementos fijos de la habitación
	object cuadro1 inherits Element(image = "assets/cuadro1-grande.png",position = game.at(5,10), description = "Una cuadro de unas flores", walkable = false){
		override method interact(){
			if(not(player.have(keyPuerta))){
				//desbloquear llave del otro cuadro
				game.say(self,"Click")
				game.say(player,"Habia una llave detras del cuadro!")
				player.pickUp(keyCuadro2)
			}
			else {
				super()
			}
		}
	}
	const keyCuadro2 = new Element(image = "assets/key.png",position = game.at(99,99), description = "", walkable = false)
	const keyArmario = new Element(image = "assets/key.png",position = game.at(99,99), description = "", walkable = false)
	const keyPuerta = new Element(image = "assets/key.png",position = game.at(99,99), description = "", walkable = false)
	
	object cuadro2 inherits Element(image = "assets/cuadro3-grande.png",position = game.at(11,10), description = "Hay un orificio extraño en el marco del cuadro", walkable = false){
		override method interact(){
			if(player.have(keyCuadro2)){
				//desbloquear siguiente nivel
				player.inventory().remove(keyCuadro2)
				game.removeVisual(keyCuadro2)
				description = "La cerradura del cuadro ha sido abierta!"
				//Hacer que se destrabe el cajon
				game.say(armario,"Click")
				game.say(player,"Habia una pequeña llave escondida en el marco!")
				player.pickUp(keyArmario)
			}
			else {
				super()
			}
		}
	}
	
	object cama inherits Element(image = "assets/cama-grande.png",position = game.at(2,6), description = "La cama esta muy desordenada", walkable = false){
		override method interact(){
			if(not(player.have(keyCuadro2))){
				//desbloquear llave del otro cuadro
				game.say(self,"*Ruido a sabanas*")
				game.say(player,"Encontre una llave debajo de las sabanas")
				player.pickUp(keyCuadro2)
			}
			else {
				super()
			}
		}
	}
	
	object armario inherits Element(image = "assets/armario-grande.png",position = game.at(14,9), description = "Un armario, no tiene nada util dentro", walkable = false){
		override method interact(){
			if(player.have(keyArmario)){
				//desbloquear llave del otro cuadro
				game.say(player,"Habia un boton escondido detras de un libro")
				player.inventory().remove(keyArmario)
				game.removeVisual(keyArmario)
				game.say(cuadro1,"*Click*")
			}
			else {
				super()
			}
		}
	}

	const key2 = new PickUp(image = "assets/key.png",position = game.at(07,05), description = "Parece una llave de una puerta")
	
	object door2 inherits Element(image = "assets/closedDoor.png", position = game.at(8,10), description = "Una puerta cerrada") {
	override method interact(){
			if(player.have(key2)){
				//desbloquear siguiente nivel
				player.inventory().remove(key2)
				game.removeVisual(key2)
				image = "assets/openDoor.png"
				description = "La puerta se ha abierto!"
				//Hacer un schedule aca para cambiar nivel
				game.schedule(1000,{juego.cargarNivel(2)})
			}
			else {
				super()
			}
		}
	}
	
