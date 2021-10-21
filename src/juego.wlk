import wollok.game.*
import player.*
import timer.*
import Escenario.*
import sombrero.*


object juego {
	const property width = 17
	const property height = 14
	const property pDigit = new Digito(desc="uno",contador=0,position=game.at(09,12),time=1000, limit=9)
	const property sDigit = new Digito(desc="dos",contador=5,position=game.at(08,12),time=11000)
	const property tDigit = new Digito(desc="tres",contador=4,position=game.at(07,12),time=60000, limit=5)
	const property timer = [tDigit, sDigit, pDigit]
	const musica = game.sound("assets/soundtrack.mp3")
	
	var nivel1 = new Escenario(background="assets/roomBackground.jpg", codigo=1234, objetos=[box,sombrero,door,key,player])
	var nivel2 = new Escenario(background="assets/roomBackground.jpg", codigo=1234, objetos=[door,key,player])
	
	const niveles = [nivel1,nivel2]
	
	method cargarNivel(numero){
		niveles.get(numero).inicializar()
		player.position(game.center())
	}
	
	method iniciar() {
		game.height(height)
      	game.width(width)
      	game.title("TP Game - Maze Escape")
		
		self.cargarNivel(0)
		
		
		

		//------------Visuales------------------------
		timer.forEach{
			unDigito => game.addVisual(unDigito)
						game.onTick(unDigito.time(),unDigito.desc()+"digit",{unDigito.cambia()})
						
		}
		
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

		game.start()
		
	}
		
		// ¿Por que refresca cada item aca?
		method showInventory(){
			const inventory = player.inventory()
			var x = 3
			inventory.forEach{ item => 	
					game.removeVisual(item)
					item.changePosition(game.at(x,0));
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