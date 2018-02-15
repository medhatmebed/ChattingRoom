//
//  RegisterViewController.swift
//  ChattingRoom
//
//  Created by medhat on 2/14/18.
//  Copyright © 2018 Medhatm3bd. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {


    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        

        SVProgressHUD.show()
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                self.failureAlert()
                print(error!)
            }
            else {
                print("success")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
  
        
    }
    func failureAlert(){
        let alert = UIAlertController(title: "Registration failed", message: "connection error", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { (action) in
            SVProgressHUD.dismiss()
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    
}
