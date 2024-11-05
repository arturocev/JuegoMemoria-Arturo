//
//  ViewController.swift
//  JuegoMemoria
//
//  Created by user257493 on 10/22/24.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var imagen1UI: UIImageView!
    @IBOutlet weak var imagen2UI: UIImageView!
    @IBOutlet weak var botonJugarUI: UIButton!
    @IBOutlet weak var ingresarNombre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inicio()
        let numeroRandom = insertarImagenes(listaImagenes: listaImagenes)
        var numeroRandom2 = insertarImagenes(listaImagenes: listaImagenes)
        
        imagen1UI.image = listaImagenes[numeroRandom]
        idImagen1 = numeroRandom
        
        while numeroRandom == numeroRandom2 {
            numeroRandom2 = Int.random(in: 0...3)
        }
        
        imagen2UI.image = listaImagenes[numeroRandom2]
        idImagen2 = numeroRandom2
    }
    
    func inicio() {
        botonJugarUI.isEnabled = false
        botonJugarUI.alpha = 0.6
    }
    
    func error() {
        botonJugarUI.setTitle("NOMBRE INCORRECTO", for: .normal)
        botonJugarUI.isEnabled = false
        botonJugarUI.alpha = 0.6
    }
    
    func nombreValido() {
        botonJugarUI.setTitle("JUGAR", for: .normal)
        botonJugarUI.isEnabled = true
        botonJugarUI.alpha = 1
    }
    
    @IBAction func jugarPulsado(_ sender: UIButton) {
         comenzarJuego()
    }
    
    
    
    @IBAction func escribirNombre(_ sender: Any) {
        
        let usuario = Usuario(nombre: ingresarNombre.text!)
        
        let valido = usuario.validarNombre(nombre: ingresarNombre.text!)
        if valido == true {
            nombreValido()
        } else {
            error()
        }
    }
    
    
    func insertarImagenes(listaImagenes: [UIImage?]) -> Int
    {
        let numeroRandom = Int.random(in: 0...3)
        return numeroRandom
    }
    
    func comenzarJuego() {
        performSegue(withIdentifier: "Juego", sender: nil)
    }
}


