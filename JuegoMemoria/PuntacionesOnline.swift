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

        
        let url = URL(string: "https://qhavrvkhlbmsljgmbknr.supabase.co/rest/v1/scores?select=*")

        let apikey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFoYXZydmtobGJtc2xqZ21ia25yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA3MjY5MTgsImV4cCI6MjAxNjMwMjkxOH0.Ta-_lXGGwSiUGh0VC8tAFcFQqsqAvB8vvXJjubeQkx8"
        
        var solicitudGet = URLRequest(url: url!)
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
}
