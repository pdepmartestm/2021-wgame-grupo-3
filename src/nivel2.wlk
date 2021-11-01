import wollok.game.*
import player.*
import Escenario.*
import juego.*

///-------------------- Nivel2 -------------------
//Elementos fijos de la habitación
	object cuadro1 inherits Element(image = "assets/cuadro1-grande.png",position = game.at(5,10), description = "Una cuadro de unas flores", walkable = false){
		override method interact(){
			if(player.have(keyCuadro1) && not(player.have(keyPuerta))){
				//desbloquear llave del otro cuadro
				game.say(self,"Click")
				player.inventory().remove(keyCuadro1)
				game.removeVisual(keyCuadro1)
				game.schedule(1000,{game.say(player,"Había una llave detras del cuadro!")})
				keyPuerta.position(game.at(99,99))
				game.addVisual(keyPuerta)
				player.pickUp(keyPuerta)
			}
			else {
				super()
			}
		}
	}
	
	object cuadro2 inherits Element(image = "assets/cuadro3-grande.png",position = game.at(11,10), description = "Hay un orificio extraño en el marco del cuadro", walkable = false){
		override method interact(){
			if(player.have(keyCuadro2)){
				//desbloquear siguiente nivel
				player.inventory().remove(keyCuadro2)
				game.removeVisual(keyCuadro2)
				description = "La cerradura del cuadro ha sido abierta!"
				//Hacer que se destrabe el cajon
				game.schedule(1000,{game.say(armario,"Click")})
				game.schedule(1000,{game.say(player,"Había una pequeña llave escondida en el marco!")})
				player.pickUp(keyArmario)
			}
			else {
				super()
			}
		}
	}
	
	object cama inherits Element(image = "assets/cama-grande.png",position = game.at(2,6), description = "La cama está muy desordenada", walkable = false){
		var property interacted = false
		override method interact(){
			if(not(player.have(keyCuadro2)) && not(self.interacted())){
				//desbloquear llave del otro cuadro
				game.schedule(1000,{game.say(self,"*Ruido a sabanas*")})
				game.schedule(1000,{game.say(player,"Encontre una llave debajo de las sabanas")})
				self.interacted(true)
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
				player.pickUp(keyCuadro1)
				game.schedule(1000,{game.say(cuadro1,"*Click*")})
			}
			else {
				super()
			}
		}
	}
	

const door2 = new Puerta(image = "assets/closedDoor.png", position = game.at(8,10), description = "Otra puerta cerrada")
const keyCuadro2 = new Element(image = "assets/key.png",position = game.at(99,99), description = "", walkable = false)
const keyArmario = new Element(image = "assets/key.png",position = game.at(99,99), description = "", walkable = false)
const keyCuadro1 = new Element(image = "assets/key.png",position = game.at(99,99), description = "", walkable = false)
const manzana= new PickUp(image="assets/manzana.png", position= game.at(6,8),description="Fruta noble")	
