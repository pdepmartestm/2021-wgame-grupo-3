import player.*
import juego.*
import wollok.game.*


class Nivel {
	var property objetos = new List()
	var property background
	var property completado = false
	
	method inicializar(){
		game.clear()
		game.boardGround(background)
		//Dibuja los objetos del nivel
		objetos.forEach({x => game.addVisual(x)})
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

class Puerta inherits Element {
	
	override method interact(){
			
			
			if(player.have(keyPuerta)){
				//Desbloquea el siguiente nivel
				player.inventory().remove(keyPuerta)
				game.removeVisual(keyPuerta)
				player.inventory().clear()
				image = "assets/openDoor.png"
				description = "La puerta se ha abierto!"
				//Hacer un schedule aca para cambiar nivel

				game.schedule(1000,{juego.cargarNivel()})
				
			}else{
				super()
			}
		
					
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

	const billete = new PickUp(image="assets/billete.jpg", position=game.at(6,8), description= "Es un billete")
	const door = new Puerta(image = "assets/closedDoor.png", position = game.at(8,10), description = "La primer puerta cerrada")
	const fakeDoor = new Element(image = "assets/closedDoor.png", position = game.at(10,10), description = "Parece una puerta falsa")	
	
const keyPuerta = new PickUp(image = "assets/key.png",position = game.at(13,4), description = "Parece una llave de una puerta")
		
object sombrero {
	
	var property position=game.at(05, 06)
	var property frases=["escapa rápido", "debes pensar por ti mismo","soy el sombrero seleccionador que te ayudará"]
	var property description="para explorar un objeto presiona space"
	var property walkable = true
	
	method image(){
	return "assets/sombrero.png"
	}
	
	method azar(){
		return 0.randomUpTo(frases.size()-1)
	}	
	method collision(){
		game.say(self,description)
		game.schedule(2000,{juego.reproducirMusica()})
		walkable=false
	}
	
	method interact(){
		game.say(self,frases.get(self.azar()))
	}

}

	
