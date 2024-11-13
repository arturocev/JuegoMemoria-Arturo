//
//  VariablesGlobales.swift
//  JuegoMemoria
//
//  Created by user257493 on 10/23/24.
//

import Foundation
import UIKit

let listaImagenes = [UIImage(named: "batido"), UIImage(named: "queso"), UIImage(named: "patata"), UIImage(named: "sandwich")]
var idImagen1 = -1
var idImagen2 = -1
var puntuaciones = [Usuario]()
var puntuacionActual = 0
var usuario = Usuario()
var users: [Usuario] = []
var urlAPI = URL(string: "https://qhavrvkhlbmsljgmbknr.supabase.co/rest/v1/scores?select=*")

let apikey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFoYXZydmtobGJtc2xqZ21ia25yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA3MjY5MTgsImV4cCI6MjAxNjMwMjkxOH0.Ta-_lXGGwSiUGh0VC8tAFcFQqsqAvB8vvXJjubeQkx8"
