import AlgunaAves.*
class Isla {
	var aves = []
	var property alpiste = 10
	var property maiz = 10
	
	var property estaEnPaz
	method obtecionDeAves(ave){aves.add(ave)}
	method avesMuertas(ave){aves.remove(ave)}	
	method avesDebiles(){return aves.filter({pajaros => pajaros.fuerza() < 1000})}
	method fuerzaTotal(){return aves.sum({pajaros =>pajaros.fuerza()})}
	method esRobusta(){return aves.all({pajaros => pajaros.fuerza() > 300})}
	method terremoto(){ aves.forEach({pajaros => pajaros.recibeUnDisgusto()})}
	method tormenta(){ self.avesDebiles().forEach({pajaros => pajaros.recibeUnDisgusto()})}
	method aveCapitana(){return aves.filter({pajaros => pajaros.fuerza().between(1000,3000)})}
	method sesionDeRelax(){aves.forEach({pajaros => pajaros.seRelaje()})}
	method estaEnPaz(){return aves.all{pajaros => pajaros.estaConformeCon(self)}}
	method alimentacion(){
		aves.forEach({pajaros => pajaros.tomarAlimentoDeLaIsla(self)})
	}
	
}
