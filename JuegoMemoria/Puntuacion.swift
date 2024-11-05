import Foundation
import UIKit

class Puntuacion: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return puntuaciones.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "IdCelda", for: indexPath)
        celda.textLabel?.text = puntuaciones[indexPath.row]
        return celda

    }
    
    
    @IBOutlet weak var tablaPuntuacion: UITableView!
    @IBOutlet weak var resultadoActual: UILabel!
    @IBOutlet weak var vueltaInicio: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tablaPuntuacion.dataSource = self
        tablaPuntuacion.delegate = self
        
        resultadoActual.text = "RESULTADO ACTUAL: " + puntuacionActual
        
    }
    
    
    @IBAction func vueltaInicioPulsado(_ sender: Any) {
        volverAJugar()
    }
    
    func volverAJugar() {
        
        performSegue(withIdentifier: "Inicio", sender: nil)
        
    }
}
