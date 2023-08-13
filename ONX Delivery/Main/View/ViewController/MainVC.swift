//
//  MainVCViewController.swift
//  ONX Delivery
//
//  Created by Basma on 12/08/2023.
//

import UIKit

class MainVC: ParentViewController {
    
    var viewModel = MainViewModel()
    
    var newBtActive = true
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newBT: UIButton!
    @IBOutlet weak var othersBT: UIButton!
    @IBOutlet weak var switchStackV: UIStackView!
    @IBAction func newOrdersAction(_ sender: Any) {
        newBTPressedView()
    }
    @IBAction func othersOrdersAction(_ sender: Any) {
        othersBTPressedView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appState = self
        navigationController?.navigationBar.isHidden = true
        initView()
    }
    
    func initView() {
        roundViewCornersShadow(view: switchStackV, radius: 15)
        roundViewCorners(view: newBT, radius: 15)
        roundViewCorners(view: othersBT, radius: 15)
        
    }
    
    func newBTPressedView() {
        newBT.backgroundColor = Color.themeColor.value
        newBT.setTitleColor(UIColor.white, for: .normal)
        newBT.titleLabel?.textColor = UIColor.white
        othersBT.backgroundColor = UIColor.clear
        othersBT.titleLabel?.textColor = Color.themeColor.value
        newBtActive = true
    }
    
    func othersBTPressedView() {
//        othersBT.backgroundColor = Color.themeColor.value
//        othersBT.titleLabel?.textColor = UIColor.white
//        newBT.backgroundColor = UIColor.clear
//        newBT.titleLabel?.textColor = Color.themeColor.value
//
//        newBtActive = false
    }
    
}

extension MainVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.createData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        roundViewCornersShadow(view: cell.mainView, radius: 15)
        
        cell.fillData(rowData: viewModel.createData()[indexPath.row])
        return cell
    }
    
    
}

extension MainVC : AppStateDelegate {
    func appEnteredBG() {
        navigationController?.popViewController(animated: true)
    }
    
    func appInactive() {
        
    }
}
