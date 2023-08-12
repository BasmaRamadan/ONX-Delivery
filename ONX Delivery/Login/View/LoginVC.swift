//
//  LoginVC.swift
//  ONX Delivery
//
//  Created by Basma on 11/08/2023.
//

import UIKit

class LoginVC: ParentViewController {
    
    var viewModel = LoginViewModel()

    @IBOutlet weak var userIDView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var userIDTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBT: UIButton!
    
    @IBAction func loginAction(_ sender: Any) {
//        guard let userID = self.userIDTF.text, userID != "" else {
//            self.showAlert(title: "", message: "Please enter User ID!".localized, shouldpop: false)
//            return
//        }
//        guard let password = self.passwordTF.text, password != "" else {
//            self.showAlert(title: "", message: "Please enter password!".localized, shouldpop: false)
//            return
//        }
//    self.showLoader()
    loginBT.isEnabled = false
        let userID = self.userIDTF.text!
        let password = self.passwordTF.text!
    viewModel.getUser(id: userID, password: password)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews ()
        
        
    }

    func initViews () {
        userIDTF.delegate = self
        passwordTF.delegate = self
        roundViewCorners(view: userIDView, radius: 25)
        roundViewCorners(view: passwordView, radius: 25)
        roundViewCorners(view: loginBT, radius: 25)
    }

}

