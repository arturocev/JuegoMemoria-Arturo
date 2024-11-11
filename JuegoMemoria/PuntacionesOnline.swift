//
//  PuntacionesOnline.swift
//  JuegoMemoria
//
//  Created by alumnos on 6/11/24.
//

import Foundation
import UIKit
var datos = ["prueba"]
class PuntuacionesOnline: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "idCeldaPuntuaciones", for: indexPath)
        celda.textLabel?.text = datos[indexPath.row] // Array de String
        return celda
    }
    
    @IBOutlet weak var tablaPuntuacionesOnline: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        peticionGET()
    
    }
    
    func peticionGET() {
        
        let url = URL(string: "https://private-088c5a-usuarios4.apiary-mock.com/users")

        URLSession.shared.dataTask(with: url!) {
        (data, response, error) in
        if error == nil {
            var users: [Usuario] = []
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                users.removeAll()
                for user in json as! [[String: Any]] {
                    users.append(Usuario(json: users))
                }
            } catch let errorJson {
                print(errorJson)
            }
        }
        }.resume()
        
    }
}
