import wollok.game.*

class Maiz {
	const property position
	var property esAdulta = false
	
	method image() {
		return "corn_" + self.sufijo() + ".png"
	}
	
	method sufijo() {
		return if esAdulta "adult" else "baby" 
	}

	method regar() {
		esAdulta = true
	}
	
	method valor() {
		return 150
	}
	
	method esCocechable() {
		return esAdulta
	}
}

class Trigo {
	const property position
	var property etapaDeEvolucion = 0
	
	method image() {
		return "wheat_" + self.etapaDeEvolucion().toString() + ".png"
	}

	method regar() {
		if (etapaDeEvolucion == 3) {
			etapaDeEvolucion = 0
		} else {
			etapaDeEvolucion += 1
		}
	}
	
	method valor() {
		return 0.max((etapaDeEvolucion - 1) * 100)
	}
	
	method esCocechable() {
		return etapaDeEvolucion >= 2
	}
}

class Tomaco {
	var property position
	
	method image() {
		return "tomaco.png"
	}
	
	method columna() {
		return self.position().x()
	}

	method regar() {
		if (self.position().y()==9) {
			position = position.down(9)
		} else {
			position = position.up(1)
		}
	}

	
	method valor() {
		return 80
	}
	
	method esCocechable() {
		return true
	}
}