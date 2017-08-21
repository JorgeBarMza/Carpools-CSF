//
//  ViewController.swift
//  Carpools
//
//  Created by Jorge on 11/11/16.
//  Copyright © 2016 Jorge. All rights reserved.
//

import UIKit
import Firebase

class Registro: UIViewController {

    let ref = FIRDatabase.database().reference()

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var matriculaTextField: UITextField!
    @IBOutlet weak var contrasenaTextField: UITextField!

    @IBOutlet weak var postalTextField: UITextField!
    
    @IBOutlet weak var celularTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Registro.dismissKeyboard))
        
      
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)

    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func ingresarClicked(_ sender: Any) {
        
        if(nombreTextField.text != "" && matriculaTextField.text != "" && contrasenaTextField.text != "" && postalTextField.text != "" && celularTextField.text != "" && matriculaTextField.text?.characters.count == 9 && postalTextField.text?.characters.count == 5 && celularTextField.text?.characters.count == 10){
            
                let estudianteJson = [
                    "Nombre": nombreTextField.text!,
                    //                "Contrasena": contrasenaTextField.text!,
                    //                "Postal": postalTextField.text!,
                    "Celular": celularTextField.text!
                ]
                
                self.ref.child(postalTextField.text!).child(matriculaTextField.text!).setValue(estudianteJson)
            
                let alert = UIAlertController.init(title: "Acuerdo de Privacidad", message: "\n Yo \(nombreTextField.text!) me comprometo a no compartir los datos que se presentarán y libero de responsabilidad a ITESM CSF quien tiene derechos de autor." , preferredStyle: .alert)
                let aceptarAction = UIAlertAction.init(title: "Acepto", style: .default, handler: {(aceptarAction)-> Void in self.performSegue(withIdentifier: "showResultado", sender: nil)})
                alert.addAction(aceptarAction)
                present(alert, animated: true, completion: nil)
            
        }
        else{
            let alert = UIAlertController.init(title: "Datos Inválidos", message: "\n Revise que la información sea correcta en todos los campos" , preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)

        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! Resultado
        destinationVC.postal = self.postalTextField.text!
    }
    

}

