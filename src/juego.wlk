import wollok.game.*
import player.*
import timer.*
import Escenario.*
import sombrero.*
import nivel3.*

object juego {
	const property width = 17
	const property height = 14
	const property pDigit = new Digito(contador=9,position=game.at(09,12),time=1000)
	const property sDigit = new Digito(contador=1,position=game.at(08,12),time=10000, limit=5)
	const property tDigit = new Digito(contador=1,position=game.at(07,12),time=30000)
	const property timer = [tDigit, sDigit, pDigit]
	const musica = game.sound("assets/soundtrack.mp3")
	
	const nivel1 = new Escenario(background="assets/roomBackground.jpg", codigo=1234, objetos=[box,sombrero,door,key,player])
	const nivel2 = new Escenario(background="assets/roomBackground.jpg", codigo=1234, objetos=[door2,cuadro1,cuadro2,keyCuadro2,cama,armario,keyArmario,keyPuerta,player])
	const nivel3 = new Escenario(background="assets/roomBackground.jpg", codigo=1234, objetos= buttons + [door3,confirmButton,player])
	
	const niveles = [nivel1,nivel2,nivel3]
	
	method cargarNivel(numero){
		niveles.get(numero).inicializar()
		player.position(game.center())
		
		//------------Visuales------------------------
		timer.forEach{
			unDigito => game.addVisual(unDigito)
						game.onTick(unDigito.time(),"CambiandoDigito",{unDigito.cambia()})
						
		}
		game.schedule(120000,{game.say(player, "Perdi!"); game.stop()})
		
		//------------Collide------------------

		game.onCollideDo(player, { elemento =>
			elemento.collision()
		})
		
		//------------Controles------------------
		keyboard.left().onPressDo({player.moveLeft() })
      	keyboard.right().onPressDo({player.moveRight() })
		keyboard.up().onPressDo({player.moveUp()})
		keyboard.down().onPressDo({player.moveDown() })
		
		keyboard.space().onPressDo({player.interact()})
	}
	
	method iniciar() {
		game.height(height)
      	game.width(width)
      	game.title("TP Game - Maze Escape")
		
		self.cargarNivel(0)	

		game.start()
		
	}
		
		// ¿Por que refresca cada item aca?
		method showInventory(){
			var x = 3
			player.inventory().forEach{ item => 	
					game.removeVisual(item)
					item.position((game.at(x,0)))
					game.addVisual(item)	
					x++;
			}
		}
		
		method reproducirMusica(){
			
			musica.initialize()
			musica.play()
			musica.volume(1)
		}
	
}