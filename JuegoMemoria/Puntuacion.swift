import Foundation
import UIKit

class Puntuacion: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return puntuaciones.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "IdCelda", for: indexPath)
        
        celda.textLabel?.text = puntuaciones[indexPath.row].name + ": " + puntuaciones[indexPath.row].score.description
        
        return celda
        
    }
    
    
    @IBOutlet weak var tablaPuntuacion: UITableView!
    @IBOutlet weak var resultadoActual: UILabel!
    @IBOutlet weak var vueltaInicio: UIButton!
    @IBOutlet weak var botonOnline: UIButton!
    @IBOutlet weak var botonSubirPuntuacion: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tablaPuntuacion.dataSource = self
        tablaPuntuacion.delegate = self
        
        resultadoActual.text = "RESULTADO ACTUAL: " + puntuacionActual.description
        
    }
    
    
    @IBAction func vueltaInicioPulsado(_ sender: Any) {
        volverAJugar()
    }
    
    func volverAJugar() {
        
        performSegue(withIdentifier: "Inicio", sender: nil)
        
    }
    
    @IBAction func botonOnlinePulsado(_ sender: Any) {
        verPuntuacionesOnline()
    }
    
    func verPuntuacionesOnline() {
        performSegue(withIdentifier: "PuntuacionOnline", sender: nil)
    }
    
    @IBAction func botonSubirPulsado(_ sender: Any) 
    {
        peticionPOST()
    }
    
    func peticionPOST() {
        
        var solicitudPOST = URLRequest(url: urlAPI!)
        solicitudPOST.httpMethod = "POST"
        solicitudPOST.addValue(apikey, forHTTPHeaderField: "apikey")
        
        let parametros = "name=\(usuario.name)&score=\(usuario.score)"
        solicitudPOST.httpBody = parametros.data(using: .utf8)
        
        
        URLSession.shared.dataTask(with: solicitudPOST) {
            (data, response, error) in
            var subirModificar: Bool
            let httpResponse = response as? HTTPURLResponse
            
            if error == nil && httpResponse!.statusCode == 201 {
                subirModificar = true
                DispatchQueue.main.async {
                    self.cambiarEstadoBotonSubirPuntiacion(subirModificar: subirModificar)
                }
           
                
            }
            else {
                self.peticionPATCH()
                subirModificar = false
                DispatchQueue.main.async {
                    self.cambiarEstadoBotonSubirPuntiacion(subirModificar: subirModificar)
                }
            }
            
            
        }.resume()
    }
    
    func cambiarEstadoBotonSubirPuntiacion(subirModificar: Bool) {
        
        if subirModificar == true
        {
            botonSubirPuntuacion.isEnabled = false
            botonSubirPuntuacion.alpha = 0.6
            botonSubirPuntuacion.setTitle("PUNTUACIÓN SUBIDA", for: .normal)
            
        } else {
            
            botonSubirPuntuacion.isEnabled = false
            botonSubirPuntuacion.alpha = 0.6
            botonSubirPuntuacion.setTitle("PUNTUACIÓN MODIFICADA", for: .normal)
        }
        
    }
    
    func peticionPATCH() 
    {
        let urlPATCH = URL(string:"https://qhavrvkhlbmsljgmbknr.supabase.co/rest/v1/scores?name=eq.\(usuario.name)")
        var request = URLRequest(url: urlPATCH!)
        request.httpMethod = "PATCH"
        request.addValue(apikey, forHTTPHeaderField: "apikey")

            // JSON Body
            let bodyObject = [
                "score": "\(usuario.score)"
            ]
        var _: NSError?
        request.httpBody = try? JSONSerialization.data(withJSONObject: bodyObject)

        let task = URLSession.shared.dataTask(with: request)
        task.resume()
      
        }
    }

