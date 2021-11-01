import wollok.game.*
import player.*
import Escenario.*
import juego.*
import sombrero.*

class Button inherits Element {
	const pressedImage 
	const property color = "gris"
	var property isPressed = false
	
	method press(){
		image = pressedImage
		isPressed = true
		description = "Un botón " + color + " presionado"
		secuences.currentSecuence().add(color)
	}
	
	method unPress(){
		image = "assets/button.png"
		isPressed = false
		description = "Un botón "+color
	}

	override method collision(){
		if(!isPressed){
			self.press()
		}
		else{
			
		}
	}
	
}

object confirmButton inherits Element(position = game.at(8,6),description = "Un botón",image = "assets/confirmButton.png", walkable = false){
	
	var hints = false
	override method interact(){
		
		if(not(hints)) {game.onTick(2000,"HintGiver",{secuences.hint()});hints = true}
		self.validate()
	}
	
	method validate(){
		if(secuences.currentSecuence() == secuences.validSecuence()){
			door3.unlock()
		}
		else{
			secuences.currentSecuence().clear()
			buttons.forEach{
				button => button.unPress()
			}
		}
	}
	
	
	
}

const greenButton = new Button(color = "verde",pressedImage = "assets/pressedGreenButton.png", position = game.at(6,4),description = "Un botón",image = "assets/button.png")
const blueButton = new Button(color = "azul",pressedImage = "assets/pressedBlueButton.png", position = game.at(3,4),description = "Un botón",image = "assets/button.png")
const yellowButton = new Button(color = "amarillo", pressedImage = "assets/pressedYellowButton.png", position = game.at(13,4),description = "Un botón",image = "assets/button.png")
const redButton = new Button(color = "rojo",pressedImage = "assets/pressedRedButton.png", position = game.at(10,4),description = "Un botón",image = "assets/button.png")

const buttons = [greenButton, blueButton, yellowButton, redButton]

object secuences {
	const validSecuence = ["verde","azul","amarillo","rojo"]
	const currentSecuence = []
	const hints = ["Al principio nos rodeaba la frondoza naturaleza,","con la inagotable agua de la lluvia se nutría","hasta que el sol irrumpió sin cesar","y asi se alzó el fuego, que no se pudo apagar."]
	var currentHint = 0
	
	method currentSecuence(){
		return currentSecuence
	}
	
	method validSecuence(){
		return validSecuence
	}
	
	
	method hint(){
		if(currentHint == 4) {currentHint = 0}
		
		console.println("Hint: "+hints.get(currentHint))
		game.say(confirmButton, hints.get(currentHint))
		currentHint++
	}
}

object door3 inherits Element(image = "assets/closedDoor.png", position = game.at(8,10), description = "Una puerta cerrada"){
	var property unlocked = false
	
	method unlock(){
				image = "assets/openDoor.png"
				description = "La puerta se ha abierto!"
				game.say(self,"Click!")
				game.removeTickEvent("HintGiver")
				unlocked = true
	}
	
	override method interact(){
		if(unlocked){
		game.say(player,self.description())
		//Fin del juego!
		player.decir("He logrado Escapar!")
		game.schedule(2000,{game.stop()})	
		}
		else{
			super()
		}
		
	}
}
