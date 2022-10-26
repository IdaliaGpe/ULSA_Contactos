//
//  NuevoController.swift
//  Contactos
//
//  Created by Alumno on 10/26/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class NuevoController: UIViewController {
    
    var contacto : Contactos?
    var callBackNuevo : ((Contactos) -> Void)?
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtNumero: UITextField!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func doTapNuevo(_ sender: Any) {
        if callBackNuevo != nil {
            contacto = Contactos(nombre: txtNombre.text ?? "nombre", numero: txtNumero.text ?? "nombre")
            callBackNuevo!(contacto!)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
