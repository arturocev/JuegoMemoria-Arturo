import Foundation


class Usuario {
    var nombre = ""
    var score = ""
    
    init() {}
    
    init(nombre: String) {
        self.nombre = nombre
    }
    
    init(score: String) {
        self.score = score
    }
    
    func tieneCaracteresEspeciales(texto: String) -> Bool {
        let especiales = "!¡$%/()?¿+-*,.;:{}[]"
        for letra in texto {
            for especial in especiales {
                if letra == especial {
                    return true
                }
            }
        }
        return false
    }

    func validarNombre(nombre: String) -> Bool {
        if nombre.isEmpty {
            return false
        }
        let maximo10Letras = nombre.count <= 10
        let primeraLetra = !nombre.first!.isNumber
        let sinEspeciales = !tieneCaracteresEspeciales(texto: nombre)
        return maximo10Letras && primeraLetra && sinEspeciales
    }
}
