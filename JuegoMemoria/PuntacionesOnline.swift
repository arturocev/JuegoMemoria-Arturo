//
//  PuntacionesOnline.swift
//  JuegoMemoria
//
//  Created by alumnos on 6/11/24.
//

import Foundation
import UIKit
class PuntuacionesOnline: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return puntuaciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "idCeldaPuntuaciones", for: indexPath)
        celda.textLabel?.text = puntuaciones[indexPath.row].name
        print(puntuaciones[indexPath.row].name)// Array de String
        return celda
    }
    
    @IBOutlet weak var tablaPuntuacionesOnline: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //peticionGET()
    
    }
    
    func peticionGET() {

        
        let url = URL(string: "https://private-088c5a-usuarios4.apiary-mock.com/users")

        URLSession.shared.dataTask(with: url!) {
        (data, response, error) in
        if error == nil {
            
           
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                users.removeAll()
                for user in json as! [[String: Any]] {
                    users.append(Usuario(json: user))
                }
                
                DispatchQueue.main.async {
                    self.tablaPuntuacionesOnline.reloadData()
                }
                
            } catch let errorJson {
                print(errorJson)
            }
        }
        }.resume()
        
    }
}
