//
//  ContactosController.swift
//  Contactos
//
//  Created by Alumno on 10/24/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class ContactosController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvContactos: UITableView!

    //Variables
    var contacto : [Contactos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacto.append(Contactos(nombre: "Claudia", numero: "6442698756"))
        contacto.append(Contactos(nombre: "Carlos", numero: "6441591422"))
        
        //tvContactos.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEditar" {
            let destino = segue.destination as! EditarController
            destino.contacto = contacto[tvContactos.indexPathForSelectedRow!.row]
            destino.callbackActualizar = actualizarEtiqueta
        }
        
        if segue.identifier == "goToNuevo" {
            let destino = segue.destination as! NuevoController
            destino.callBackNuevo = nuevoEtiqueta
        }
    }
    
    func nuevoEtiqueta(contacto: Contactos){
        self.contacto.append(contacto)
        tvContactos.reloadData()
    }
    
    //Codigo Actualizar
    func actualizarEtiqueta() {
        tvContactos.reloadData()
        }
    
    //Tabla
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
