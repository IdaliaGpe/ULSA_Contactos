//
//  EditarController.swift
//  Contactos
//
//  Created by Alumno on 10/26/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class EditarController: UIViewController {
    
    //Outlet
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtNumero: UITextField!
    
    //Variables
    var contacto : Contactos?
    var callbackActualizar : (() -> Void)?
    
    //Codigo
    override func viewDidLoad() {
        super.viewDidLoad()
        if contacto != nil {
            
            txtNombre.text = contacto!.nombre
            txtNumero.text = contacto!.numero
        }
    }
    
    //Codigo + Action
    @IBAction func doToActualizar(_ sender: Any) {
        if callbackActualizar != nil {
            
            contacto?.nombre = txtNombre.text!
            contacto?.numero = txtNumero.text!
            callbackActualizar!()
            self.navigationController?.popViewController(animated: true)
        }
    }
}
