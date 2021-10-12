import wollok.game.*
import player.*
import timer.*
import Escenario.*

//Elementos de la habitacion
const key = new PickUp(image = "key.png",position = game.at(05,05))

object juego {
	const property width = 17
	const property height = 14
	const property pDigit = new Digito(desc="uno",contador=0,position=game.at(09,12),time=1000, limit=9)
	const property sDigit = new Digito(desc="dos",contador=5,position=game.at(08,12),time=11000)
	const property tDigit = new Digito(desc="tres",contador=4,position=game.at(07,12),time=60000, limit=5)
	const property timer = [tDigit, sDigit, pDigit]
	
	
	method iniciar() {
		game.height(height)
      	game.width(width)
      	game.title("TP Game - NombreCreativoAqui")
		
		game.boardGround("roomBackground.jpg")
		
		//------------Visuales------------------------
		timer.forEach{
			unDigito => game.addVisual(unDigito)
						game.onTick(unDigito.time(),unDigito.desc()+"digit",{unDigito.cambia()})
						
		}
		
		game.addVisual(player)
		game.addVisual(door)
		game.addVisual(key)
		
		//------------Collide------------------

		game.whenCollideDo(player, { elemento =>
			self.showInventory()
			elemento.collision()
		})
		
		//------------Controles------------------
		
		keyboard.left().onPressDo({player.moveLeft() })
      	keyboard.right().onPressDo({player.moveRight() })
		keyboard.up().onPressDo({player.moveUp()})
		keyboard.down().onPressDo({player.moveDown() })
		
		
		
		game.start()
	}
	
		//Quizas mover esto a otro lado
		method queNoSeSalga(playerPosition,lastPosition){
		var newPosition = playerPosition
		if (playerPosition.x() >= width-2 || 
			playerPosition.x() < 2 || 
			playerPosition.y() >= height-4 || 
			playerPosition.y() < 3
		) newPosition = lastPosition 
		return newPosition
	}  
		
		
		method showInventory(){
			const inventory = player.inventory()
			var x = 3
			inventory.forEach{ item => 	
					game.removeVisual(item)
					item.changePosition(x,0);
					game.addVisual(item)	
					x++;
			}
		}
	
}