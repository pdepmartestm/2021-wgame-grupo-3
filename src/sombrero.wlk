import wollok.game.*

object sombrero {
	
	var property position=game.at(02, 03)
	var property frases=["escapa rápido", "debes pensar por ti mismo","para explorar un objeto presiona space"]
	var property description="soy el sombrero seleccionador que te ayudará"
	var property walkable = false
	
	method image(){
	return "assets/sombrero.png"
	}
	
	method azar(){
		return 0.randomUpTo(frases.size()-1)
	}	
	method collision(){
		game.say(self,frases.get(self.azar()))
	}
	
	method interact(){
		game.say(self,frases.get(self.azar()))
	}

}
