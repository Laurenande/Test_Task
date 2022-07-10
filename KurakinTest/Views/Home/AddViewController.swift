//
//  AddViewController.swift
//  KurakinTest
//
//  Created by Егор Куракин on 09.07.2022.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var rowGroupTable: UITableView!
    let identifire = "addCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        rowGroupTable.separatorColor = .darkGray
        rowGroupTable.separatorStyle = .singleLine
        rowGroupTable.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
extension AddViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as! AddTableViewCell
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "Password"
            cell.imgCell.image = UIImage(named: "lockWhite")
        case 1:
            cell.titleLabel.text = "Bank Card"
            cell.imgCell.image?.withTintColor(.green)
            cell.imgCell.image = UIImage(named: "walletWhite")
            
        case 2:
            cell.titleLabel.text = "Contact"
            cell.imgCell.image = UIImage(named: "humanWhite")
        default:
            return cell
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}
