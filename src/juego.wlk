import wollok.game.*
import jugador.*

object juego {
	const property ancho = 20
	const property alto = 10
	
	method iniciar() {
		game.height(alto)
      	game.width(ancho)
      	game.title("TP Game - NombreCreativoAqui")
		
		game.boardGround("suelo.png")
		
		game.addVisual(jugador)
		
		
		keyboard.left().onPressDo({jugador.moverseIzquierda() })
      	keyboard.right().onPressDo({jugador.moverseDerecha() })
		keyboard.up().onPressDo({jugador.moverseArriba() })
		keyboard.down().onPressDo({jugador.moverseAbajo() })
		
		game.start()
	}
	
		//Quizas mover esto a otro lado
		method queNoSeSalga(posicion){
		var nuevaPos = posicion
		if(posicion.x() >= ancho) nuevaPos = game.at(0,nuevaPos.y())
		if(posicion.x() < 0) nuevaPos = game.at(ancho-1,nuevaPos.y())
		if(posicion.y() >= alto) nuevaPos = game.at(nuevaPos.x(),0)
		if(posicion.y() < 0) nuevaPos = game.at(nuevaPos.x(),alto-1)
		return nuevaPos
		
	}  
	
}