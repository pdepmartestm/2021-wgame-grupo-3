import wollok.game.*
import jugador.*
import timer.*
import Escenario.*

object juego {
	const property ancho = 20
	const property alto = 10
	const property pDigit = new Digito(desc="uno",contador=0,position=game.at(10,09),time=1000, limit=9)
	const property sDigit = new Digito(desc="dos",contador=5,position=game.at(09,09),time=11000)
	const property tDigit = new Digito(desc="tres",contador=4,position=game.at(08,09),time=60000, limit=5)
	const property timer = [tDigit, sDigit, pDigit]
	
	method iniciar() {
		game.height(alto)
      	game.width(ancho)
      	game.title("TP Game - NombreCreativoAqui")
		
		game.boardGround("suelo.png")
		
		game.addVisual(jugador)
		
		timer.forEach{
			unDigito => game.addVisual(unDigito)
						game.onTick(unDigito.time(),unDigito.desc()+"digit",{unDigito.cambia()})
						
		}
		
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