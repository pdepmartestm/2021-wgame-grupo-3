import wollok.game.*
import juego.*

class Facing {
	
	var property position
	var property text = "down"
}

object player {
	
	var inventory = []
	var property position = game.center()
	var apuntando = new Facing(position = self.position().down(1))

	
	method image() {
		return "assets/player-"+apuntando.text()+".png"
	}
	

	method queNoSeSalga(nextPosition,actualPosition){
		var newPosition = nextPosition
		const obj = game.getObjectsIn(nextPosition)
		if ((nextPosition.x() >= juego.width()-2 || 
			nextPosition.x() < 2 || 
			nextPosition.y() >= juego.height()-4 || 
			nextPosition.y() < 3) 
			||obj.any({x => !x.walkable()})
			){
				newPosition = actualPosition 
		} 
		return newPosition
	}  
	
	
	//Métodos de movimiento
	method moveRight(){
		position = self.queNoSeSalga(position.right(1),position)
		apuntando.position(self.position().right(1))
		apuntando.text("right")
	}
	method moveLeft(){
		position = self.queNoSeSalga(position.left(1),position)
		apuntando.position(self.position().left(1))
		apuntando.text("left")
	}
	method moveUp(){
		position = self.queNoSeSalga(position.up(1),position)
		apuntando.position(self.position().up(1))
		apuntando.text("up")
	}
	method moveDown(){
		position = self.queNoSeSalga(position.down(1),position)
		apuntando.position(self.position().down(1))
		apuntando.text("down")
	}

	method decir(msg){
		game.say(self, msg)
	}
	method pickUp(thing){
		//a futuro ver si el inventario es infinito o definir qué sucede cuando se llena
		inventory.add(thing)
		thing.position(game.at(2+self.inventory().size(),0))
		juego.showInventory()
	}
	
	method have(thing){
		return inventory.contains(thing)
	}
	
	method inventory(){
		return inventory
	}
		
	method interact(){
		const obj = game.getObjectsIn(apuntando.position())
		
		if(obj.size() > 0){
			obj.asList().last().interact()
		}
	}
	
}


