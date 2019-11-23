import Islas.*
class AlgunasAve {
	var property recibeUnDisgusto
	var property fuerza
	
	method seRelaje()
	method estaConformeCon(isla)
	method tomarAlimentoDeLaIsla(isla)
}

class Aguilucho inherits AlgunasAve {
	//inicialmente es de 20 km/h pero puede variar en cualquier momento.
	var property velocidad = 20
	override method fuerza(){
		return if(velocidad <= 60){180}
		else{velocidad * 3}
	}
/*Al **recibir un disgusto**, duplica su velocidad.    
O sea, un aguilucho cuya velocidad es 40 km/h tiene 180 de fuerza.
Si recibe un disgusto, su velocidad pasa a 80 km/h, y por lo tanto, su fuerza se calcula como 240.*/
	override method recibeUnDisgusto(){
		 velocidad *= 2
	}
	//- Un aguilucho disminuye su velocidad en 10 km/h.
	override method seRelaje(){
		velocidad -= 10
	}
	override method estaConformeCon(isla){ 
		return isla.alpiste() < 8 
	}
	override method tomarAlimentoDeLaIsla(isla){
		velocidad +=15 
		return isla.alpiste() - 3
	}
}
class Albatro inherits AlgunasAve {
	var property peso = 4000
	var property masaMuscular = 600
	override method fuerza(){
		return if(peso < 6000){masaMuscular}
		else{masaMuscular / 2}
	}
	override method recibeUnDisgusto(){peso +=800}
	method irAlGimnasio(){
		masaMuscular += 500
		peso += 500
	}
	//-Un albatros pierde 300 gramos de peso.
	override method seRelaje(){
		peso -= 300
	}
	//- un albatros está conforme con una isla, si en la isla hay a lo sumo 2 aves que tengan más fuerza que él.
	override method estaConformeCon(isla){
		return isla.aves().count{pajaros => pajaros.fuerza() > self.fuerza()} <=  2
	}
	override method tomarAlimentoDeLaIsla(isla){
		masaMuscular += 700
		peso += 700
		return isla.maiz() - 4
	}
}
class Paloma inherits AlgunasAve {
	var property ira = 200
	override method fuerza() = ira * 2
	override method recibeUnDisgusto(){ira += 300}
	//- una paloma disminuye su ira en 50 unidades.
	override method seRelaje(){
		ira -= 50
	}
	override method estaConformeCon(isla){
	return isla.avesDebiles().size() >= 1
	}
	override method tomarAlimentoDeLaIsla(isla){}
	method equilibrarse(){
		 if(fuerza <= 700){self.recibeUnDisgusto()}
		 else{self.seRelaje()}
	}
}
class AguiluchoColorado inherits Aguilucho {
	override method fuerza(){
		return super() + 400	
	}
}
class PalomaTorcaza inherits Paloma {
	var property huevos = 3
	override method fuerza() = super() + 100 * huevos 
	override method recibeUnDisgusto(){
		 super() huevos += 1	
	}
}
class PalomaMontera inherits Paloma {
	var property topeDeFuerza = 2000
	
	override method fuerza(){
		return topeDeFuerza < 2000
	}
}
class PalomaManchada inherits Paloma {
const property nidos = #{}

	override method recibeUnDisgusto() {
		super()
		nidos.add(self.construirNido()) 
	}
	method construirNido() {
		return new Nido()
	}
	override method seRelaje() {
		if (nidos.size() > 2) {
			nidos.forEach{n => n.grosor(+1)}
		} else {
			super()
		}
	}
	override method ira() {
		return super() + nidos.sum{n => n.potencia()}
	}	
}

class Nido {
var property grosor = 5
// puse un const porque en  ningun momento cambia la resistencia , solo el grosor cambia.
const property resistencia = 3

	method potencia() = (grosor * resistencia) + 20
}