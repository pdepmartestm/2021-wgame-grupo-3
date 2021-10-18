import wollok.game.*
import juego.*

object player {
	
	const inventory = []
	var position = game.center()
	var facing = "down"
	
	method position() {
		return position
	}


	method image() {
		return "assets/player-"+facing+".png"
	}
	

	method queNoSeSalga(nextPosition,actualPosition){
		var newPosition = nextPosition
		const obj = game.getObjectsIn(nextPosition)
		if ((nextPosition.x() >= juego.width()-2 || 
			nextPosition.x() < 2 || 
			nextPosition.y() >= juego.height()-4 || 
			nextPosition.y() < 3) ||
			obj.any({x => !x.walkable()})){
				newPosition = actualPosition 
		} 
		return newPosition
	}  
	
	
	//Metodos de movimiento
	method moveRight(){
		facing = "right"
		position = self.queNoSeSalga(position.right(1),position)
	}
	method moveLeft(){
		facing = "left"
		position = self.queNoSeSalga(position.left(1),position)
	}
	method moveUp(){
		facing = "up"
		position = self.queNoSeSalga(position.up(1),position)
	}
	method moveDown(){
		facing = "down"
		position = self.queNoSeSalga(position.down(1),position)
	}

	method decir(msg){
		game.say(self, msg)
	}
	method pickUp(thing){
		inventory.add(thing)
		thing.position(game.at(2+self.inventory().size(),0))
	}
	
	method have(thing){
		return inventory.contains(thing)
	}
	
	method inventory(){
		return inventory
	}
/* 
	// Hay alguna manera mejor de implementar esto?
	method interact(){
		var obj
		if (facing == "up"){
			obj = game.getObjectsIn(position.up(1))
		}else{
			if (facing == "left"){
			obj = game.getObjectsIn(position.left(1))
			}else{
				if (facing == "down"){
					obj = game.getObjectsIn(position.down(1))
				}else{
					obj = game.getObjectsIn(position.right(1))
				}
			}
		}
		
		if(obj.size() > 0){
			obj.asList().last().interact()
		}
	}*/
	
}
