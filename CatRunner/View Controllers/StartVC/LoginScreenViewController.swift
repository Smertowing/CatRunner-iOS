//
//  LoginScreenViewController.swift
//  CatRunner
//
//  Created by Kiryl Holubeu on 11/14/18.
//  Copyright © 2018 Kiryl Holubeu. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func tryLogIn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainTabBarViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func createAccount(_ sender: Any) {
    
    }
    
    @IBAction func helpOption(_ sender: Any) {
    }
    
}
