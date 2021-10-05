import wollok.game.*
import player.*
import timer.*
import Escenario.*

object juego {
	const property width = 20
	const property height = 10
	const property pDigit = new Digito(desc="uno",contador=0,position=game.at(10,09),time=1000, limit=9)
	const property sDigit = new Digito(desc="dos",contador=5,position=game.at(09,09),time=11000)
	const property tDigit = new Digito(desc="tres",contador=4,position=game.at(08,09),time=60000, limit=5)
	const property timer = [tDigit, sDigit, pDigit]
	
	method iniciar() {
		game.height(height)
      	game.width(width)
      	game.title("TP Game - NombreCreativoAqui")
		
		game.boardGround("suelo.png")
		
		game.addVisual(player)
		//------------Testeando la puerta------------------
		game.addVisual(door)
		game.whenCollideDo(player, { elemento =>
			elemento.collision()
		})
		//-------------------------------------------------
		
		timer.forEach{
			unDigito => game.addVisual(unDigito)
						game.onTick(unDigito.time(),unDigito.desc()+"digit",{unDigito.cambia()})
						
		}
		
		keyboard.left().onPressDo({player.moveLeft() })
      	keyboard.right().onPressDo({player.moveRight() })
		keyboard.up().onPressDo({player.moveUp()})
		keyboard.down().onPressDo({player.moveDown() })
		
		
		
		game.start()
		
		
	}
	
		//Quizas mover esto a otro lado
		method queNoSeSalga(playerPosition){
		var newPosition = playerPosition
		if(playerPosition.x() >= width) newPosition = game.at(0,newPosition.y())
		if(playerPosition.x() < 0) newPosition = game.at(width-1,newPosition.y())
		if(playerPosition.y() >= height) newPosition = game.at(newPosition.x(),0)
		if(playerPosition.y() < 0) newPosition = game.at(newPosition.x(),height-1)
		return newPosition
		
	}  
	
}