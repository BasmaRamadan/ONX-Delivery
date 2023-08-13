//
//  MainVCViewController.swift
//  ONX Delivery
//
//  Created by Basma on 12/08/2023.
//

import UIKit

class MainVC: ParentViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.appState = self
        navigationController?.navigationBar.isHidden = true
    }

}

extension MainVC : AppStateDelegate {
    func appEnteredBG() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC")
//        self.present(vc, animated: true)
        navigationController?.popViewController(animated: true)
    }
    
    func appInactive() {
        
    }
}
