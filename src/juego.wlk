import wollok.game.*
import player.*
import timer.*
import Escenario.*
import sombrero.*
import nivel2.*
import nivel3.*

object juego {
	const property width = 17
	const property height = 14
	
	const musica = game.sound("assets/soundtrack.mp3")
	
	const nivel1 = new Escenario(background="assets/roomBackground.jpg", objetos=[box1,box2,box3,box4,box5,box6,box7,box8,sombrero,door,key,player])
	const nivel2 = new Escenario(background="assets/roomBackground.jpg", objetos=[door2,cuadro1,cuadro2,keyCuadro2,cama,armario,keyArmario,keyPuerta,keyCuadro1,player])
	const nivel3 = new Escenario(background="assets/roomBackground.jpg", objetos= buttons + [door3,confirmButton,player])
	
	const niveles = [nivel1,nivel2,nivel3]
	
	method cargarNivel(numero){
		niveles.get(numero).inicializar()
		player.position(game.center())
		const timer = new MyTimer(contador=100)
		game.onTick(1000,"CambiandoTimer",{timer.cambia()})
		
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