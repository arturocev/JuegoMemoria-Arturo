//
//  Juego.swift
//  JuegoMemoria
//
//  Created by user257493 on 10/23/24.
//

import Foundation
import UIKit

class Juego: UIViewController {
    //REFERENCIAS IMÁGENES
    
    @IBOutlet weak var imagen1UI: UIImageView!
    @IBOutlet weak var imagen2UI: UIImageView!
    @IBOutlet weak var imagen3UI: UIImageView!
    @IBOutlet weak var imagen4UI: UIImageView!
    

    
    //REFERENCIAS BOTONES
    @IBOutlet weak var botonImg1: UIButton!
    @IBOutlet weak var botonImg2: UIButton!
    @IBOutlet weak var botonImg3: UIButton!
    @IBOutlet weak var botonImg4: UIButton!
    @IBOutlet weak var botonPuntuacion: UIButton!
    
    var botonPulsado = 0
    var puntuacionTotal = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //ADICIÓN DE IMÁGENES EN LAS IMAGEVIEWS
        imagen1UI.image = listaImagenes[0]
        imagen2UI.image = listaImagenes[1]
        imagen3UI.image = listaImagenes[2]
        imagen4UI.image = listaImagenes[3]
        
        inicio()

    }
    
    
    @IBAction func AdivinarImagen(_ sender: UIButton) {
        
        if idImagen1 == sender.tag || idImagen2 == sender.tag {
            puntuacionTotal += 25
            sender.isEnabled = false
            
        } else {
            puntuacionTotal -= 20
        }
        
        botonPulsado += 1
        finPartida()
    }
    
    func inicio() {
        
        botonPuntuacion.isEnabled = false
        botonPuntuacion.alpha = 0.6
        
    }
    
    func finPartida() {
        
        if botonPulsado >= 2 {
            
            
            botonImg1.isEnabled = false
            botonImg2.isEnabled = false
            botonImg3.isEnabled = false
            botonImg4.isEnabled = false
            
            imagen1UI.alpha = 0.6
            imagen2UI.alpha = 0.6
            imagen3UI.alpha = 0.6
            imagen4UI.alpha = 0.6
            
            botonPuntuacion.isEnabled = true
            botonPuntuacion.alpha = 1
            
            puntuacionActual = String(puntuacionTotal)
            puntuaciones.insert(puntuacionActual, at: 0)
            
        }
    }
    
    @IBAction func verPuntuacionPulsado(_ sender: Any) {
        verPuntuacion()
    }
    
    func verPuntuacion() {
        performSegue(withIdentifier: "Puntuacion", sender: nil)
    }
}
