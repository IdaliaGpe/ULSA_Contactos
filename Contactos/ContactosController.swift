//
//  ContactosController.swift
//  Contactos
//
//  Created by Alumno on 10/24/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class ContactosController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Variables
    var contacto : [Contactos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacto.append(Contactos(nombre: "Claudia", numero: "6442698756"))
        contacto.append(Contactos(nombre: "Carlos", numero: "6442698756"))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contacto.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as!
        CeldaContactoController
        
        celda.lblNombre.text = contacto[indexPath.row].nombre
        celda.lblNumero.text = contacto[indexPath.row].numero
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 47
    }
}
