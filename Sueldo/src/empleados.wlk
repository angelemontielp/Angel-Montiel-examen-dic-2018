/** First Wollok example */
class Peon {
	var property precioHoraPeon = 300
	var property gremio
	
	method sueldo(h) {
		return precioHoraPeon*h
	}
	
	method tipoEmpleado(){
		return "Peon"
	}
}

class MedioOficial inherits Peon {
	var precioHoraMedioOficial = precioHoraPeon*1.05
	override method sueldo(h) {
		return precioHoraMedioOficial*h
	}
	
	override method tipoEmpleado(){
		return "MedioOficial"
	}
}

class Oficial inherits Peon {
	var precioHoraOficial = precioHoraPeon*1.1
	var cumplioObjetivo = false
	
	method cumplioObjetivo(){
	}
	override method sueldo(h) {
		if(cumplioObjetivo){
			return precioHoraOficial*h*1.3
		}else{
		return precioHoraOficial*h
		}
	}
	
	override method tipoEmpleado(){
		return "Oficial"
	}
}


class Capataz inherits Oficial{
	override method sueldo(h){
		if(cumplioObjetivo){
			return precioHoraOficial*h*1.3 + 4000
		}else{
		return precioHoraOficial*h + 4000
		}
	}
	
	override method tipoEmpleado(){
		return "Capataz"
	}
}

class SueldoNeto{
	
	var property retencion
	method ganancias(empleado){
		if(empleado.sueldo()>30000){
			retencion = (empleado.sueldo() - 30000)*0.2
		}else{
			retencion = 0
		}
	}
	
	method sueldoNeto(empleado){
		
		if(empleado.gremio()){
			return empleado.sueldo() - (empleado.sueldo())*0.18 - retencion
		}else{
			return empleado.sueldo() - (empleado.sueldo())*0.17 - retencion
		}
		
	}
}
