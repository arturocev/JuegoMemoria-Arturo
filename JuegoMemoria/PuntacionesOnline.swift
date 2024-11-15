//
//  PuntacionesOnline.swift
//  JuegoMemoria
//
//  Created by alumnos on 6/11/24.
//

import Foundation
import UIKit
class PuntuacionesOnline: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tablaPuntuacionesOnline: UITableView!
    @IBOutlet weak var BotonVolver: UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaOnline", for: indexPath)
        
        celda.textLabel?.text = users[indexPath.row].name + ": " + users[indexPath.row].score.description
        
        return celda
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tablaPuntuacionesOnline.delegate = self
        tablaPuntuacionesOnline.dataSource = self
        peticionGET()
    
    }
    
    func peticionGET() {


        var solicitudGet = URLRequest(url: urlAPI!)
        solicitudGet.httpMethod = "GET"
        solicitudGet.addValue(apikey, forHTTPHeaderField: "apikey")
        
            
        URLSession.shared.dataTask(with: solicitudGet) {
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
    @IBAction func BotonVolverPulsado(_ sender: Any) 
    {
        self.dismiss(animated: false)
    }
}
