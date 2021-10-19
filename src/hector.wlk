import wollok.game.*
import cultivos.*

object hector {
	var property position = game.center()
	const property image = "player.png"
	var property articulosAVender = []
	var property oro = 0
	
	method sembrarMaiz() {
		game.addVisual(new Maiz(position=position))
	}
	
	method sembrarTrigo() {
		game.addVisual(new Trigo(position=position))
	}
	
	method sembrarTomaco() {
		game.addVisual(new Tomaco(position=position))
	}
	
	method regarPlantas() {
		const cultivosARegar = game.colliders(self)
		if (cultivosARegar.isEmpty()) { self.error("no hay nada que regar") }
		cultivosARegar.forEach( { unCultivo => unCultivo.regar() })
	}
	
	method cosecharPlantas() {
		const cultivosACosechar = game.colliders(self).filter( { unCultivo => unCultivo.esCocheable()})
		if (cultivosACosechar.isEmpty()) { self.error("no hay nada que cosechar") }
		cultivosACosechar.forEach( 
			{ 
				unCultivo => 	self.cosechar(unCultivo)					
			}
		)
	}
	
	method cosechar(planta) {
			articulosAVender.add(planta)
			game.removeVisual(planta)
	}
	
	method venderCosechas() {
		if (articulosAVender.isEmpty()) { self.error("no hay nada que vender") }
		const aCobrar = articulosAVender.map( { unCultivo => unCultivo.valor() }).sum()
		self.acumularOro(aCobrar)
		articulosAVender = []
	}
	
	method acumularOro(cantidad) {
		oro += cantidad
	}
	
	method develarInventario() {
		game.say(self,	"tengo " + oro.toString() + " monedas, y " 
						+ articulosAVender.size().toString() + " plantas para vender"
				)
	}
	
	method dejarAspersor() {
		game.addVisual(new Aspersor(position=position))
	}
	

}
