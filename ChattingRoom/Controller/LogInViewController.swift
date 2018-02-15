//
//  LogInViewController.swift
//  ChattingRoom
//
//  Created by medhat on 2/14/18.
//  Copyright © 2018 Medhatm3bd. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        SVProgressHUD.show()
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                self.failureAlert()
                print(error!)
            }
            else {
                print("login is success")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
    }
    func failureAlert(){
        let alert = UIAlertController(title: "login failed", message: "invalid username or password", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { (action) in
            SVProgressHUD.dismiss()
            self.dismiss(animated: true, completion: nil)
            })
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    


    
}  
