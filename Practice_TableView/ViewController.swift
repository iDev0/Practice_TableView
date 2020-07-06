//
//  ViewController.swift
//  Practice_TableView
//
//  Created by iDev0 on 2020/07/05.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import UIKit
import XLActionController
import ProgressHUD

class ViewController: UIViewController {

    var restaurantNames = ["Cafe DeadendJGKGKJJKGKJHJHKHJKHJKLHKJLHKLLKH;NKP;KN;PNPIN", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
        
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(CustomTableViewCell2.nib(), forCellReuseIdentifier: CustomTableViewCell2.identifier)
        
        ProgressHUD.show()
        ProgressHUD.animationType = .horizontalCirclesPulse
        ProgressHUD.colorAnimation = .red
        ProgressHUD.colorBackground = .black
        
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell2.identifier, for: indexPath) as! CustomTableViewCell2
        
        cell.imgView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]

        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell01", for: indexPath) as! CustomTableViewCell
//
//        cell.imgView.image = UIImage(named: restaurantImages[indexPath.row])
//        cell.nameLabel.text = restaurantNames[indexPath.row]
//        cell.locationLabel.text = restaurantLocations[indexPath.row]
//        cell.typeLabel.text = restaurantTypes[indexPath.row]
//
        
//        cell.textLabel?.text = restaurantNames[indexPath.row]
//        cell.detailTextLabel?.text = restaurantLocations[indexPath.row]
//        cell.imageView?.image = UIImage(named: restaurantImages[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
//        let alert = UIAlertController(title: "알림", message: restaurantNames[indexPath.row], preferredStyle: .actionSheet)
//
//        let alertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
//
//        alert.addAction(alertAction)
//
        // self.present(alert, animated: true, completion: nil)
        
        
        
        let actionController = YoutubeActionController()
        let addButton = Action(ActionData(title: "add to watch later", image: UIImage(named: "yt-add-to-watch-later-icon")!), style: .default, handler: nil)

        let playListButton = Action(ActionData(title: "play list", image: UIImage(named: "yt-add-to-playlist-icon")!), style: .default, handler: nil)
        
        let shareButton = Action(ActionData(title: "share", image: UIImage(named: "yt-share-icon")!), style: .default, handler: nil)
        
        let cancelButton = Action(ActionData(title: "cancel", image: UIImage(named: "yt-cancel-icon")!), style: .default, handler: nil)
        
        actionController.addAction(addButton)
        actionController.addAction(playListButton)
        actionController.addAction(shareButton)
        actionController.addAction(cancelButton)
        
        present(actionController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkAction = UIContextualAction(style: .normal, title: "share") { (action, sourceView, handler) in
            // 공유하기 기능
            
            // SVProgressHUD.show()
            
            handler(true)
        }
        checkAction.backgroundColor = .green
        checkAction.image = UIImage(systemName: "square.and.arrow.up")
        
        let trashAction = UIContextualAction(style: .normal, title: "trash") { (action, sourceView, handler) in
            // 공유하기 기능
            handler(true)
        }
        trashAction.backgroundColor = .red
        trashAction.image = UIImage(systemName: "trash")
        
        
        
        
        let swipeActions = UISwipeActionsConfiguration(actions: [checkAction, trashAction])
        
        return swipeActions
    }
    
    
}

