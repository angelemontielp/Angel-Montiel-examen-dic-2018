
class ComparacionSueldos {
	
	var property empleados = []
	var property donaciones = 0
	
	method agregarEmpleados(empleado) {
		empleados.add(empleado)
	}
	
	method sueldoMasBajo(){
		return empleados.min({ empleado => empleado.sueldo() })
		
	}
	
	method sueldoMasAlto(){
		return empleados.max({ empleado => empleado.sueldo() })
		
	}
	
	method cantEmpleados(){
		return empleados.size()
		
	}
	
	method cantTipoEmpleado(tipoEmpleado) {
		return empleados.filter({ empleado => empleado.tipoEmpleado().equals(tipoEmpleado) }).size()
	}
	
	method promedio(){
		return empleados.sum({ empleado => empleado.sueldo()/self.cantEmpleados() })
	}
	
	method promedioTipoEmpleado(tipoEmpleado){
		return empleados.sum().filter({ empleado => empleado.tipoEmpleado().equals(tipoEmpleado) }).sueldo()/self.cantTipoEmpleado(tipoEmpleado)
	}
	
	method bonus(empleado){
		if(donaciones > 1000 && empleado.sueldo() > 30000){
			return (empleado.sueldo() - 30000)*(0.2+ ((donaciones).roundDown(3)/1000000))	
		}else{
			return null
		}
	}
	
	
}
