//
//  ViewController.swift
//  IMCNAVIGATION
//
//  Created by Daniel Torres Moreno on 9/7/19.
//  Copyright © 2019 Daniel Torres Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Peso:Double = 0.0
    var Altura:Double = 0.0
    var imc:Double = 0.0
    
    
    @IBOutlet weak var txtEstatura: UITextField!
    @IBOutlet weak var txtPeso: UITextField!
    @IBAction func btnCalcular(_ sender: UIButton) {
        if(txtPeso.text?.isEmpty)!{
            showAlerta(titulo: "Error", mensaje: "Ingrese la altura")
        }else if (txtEstatura.text?.isEmpty)!{
            showAlerta(titulo: "Error", mensaje: "Ingrese su peso")
        }
        else{
            Peso = Double(txtPeso.text!)!
            Altura = Double(txtEstatura.text!)!
            imc=Peso/(Altura*Altura)
            if(imc>=18&&imc<25){
                self.performSegue(withIdentifier: "segueverde", sender: self)
            }else if(imc>=25 && imc<30){
                self.performSegue(withIdentifier: "segueamarillo", sender: self)
            }else if(imc>=30){
                self.performSegue(withIdentifier: "seguerojo", sender: self)
            }else{
                showAlerta(titulo: "Advertencia", mensaje: "USTED TIENE EL IMC BAJO , FAVOR DE ASISITIR CON EL MEDICO O NUTREOLOGO")            }
        }
    }

    func showAlerta(titulo: String, mensaje: String){
        //Crea La Alerta
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        //Agregar Un Boton
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        //Muestra El Alerta
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueverde"){
            let segueimc = segue.destination as! ViewControllerverde
            segueimc.imc = imc
        }else if (segue.identifier == "segueamarillo"){
            let segueimc = segue.destination as! ViewControlleramarillo
            segueimc.imc = imc
        }else if (segue.identifier == "seguerojo"){
            let segueimc = segue.destination as! ViewControllerrojo
            segueimc.imc = imc
        }
    }
}

