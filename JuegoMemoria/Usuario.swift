import Foundation


class Usuario : Decodable {
    var name = ""
    var score = 0
    
    
    init() {}
    
    init(name: String) {
        self.name = name
    }
    
    init(score: Int) {
        self.score = score
    }
    
    init(json: [String: Any]) {
            name = json["name"] as? String ?? ""
            score = json["score"] as? Int ?? 0
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

    func validarNombre(name: String) -> Bool {
        if name.isEmpty {
            return false
        }
        let maximo10Letras = name.count <= 10
        let primeraLetra = !name.first!.isNumber
        let sinEspeciales = !tieneCaracteresEspeciales(texto: name)
        return maximo10Letras && primeraLetra && sinEspeciales
    }
}
