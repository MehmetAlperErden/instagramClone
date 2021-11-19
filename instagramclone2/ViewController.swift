//
//  ViewController.swift
//  instagramclone2
//
//  Created by Alper Erden on 26.10.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }
    
    @IBAction func signInButton(_ sender: Any) {
        if emailText.text! != "" && passwordText.text! != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(tittleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
               
            }
            
        }else {
            makeAlert(tittleInput: "Error!", messageInput: "Username/Password")
        }
        
        
    }
    @IBAction func SıgnUpButton(_ sender: Any) {
        
        if emailText.text! != "" && passwordText.text! != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { [self] (authdata , error )in
                if error != nil {
                    self.makeAlert(tittleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }

        } else {
            makeAlert(tittleInput: "Error!", messageInput: "Username/Password")
        }
    }
    func makeAlert(tittleInput:String , messageInput: String) {
        let alert = UIAlertController(title: "Error", message: "Username/Password??", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

}

