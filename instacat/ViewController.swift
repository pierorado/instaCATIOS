//
//  ViewController.swift
//  instacat
//
//  Created by Piero Rado on 11/19/19.
//  Copyright © 2019 Piero Rado. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController,UICollectionViewDataSource {

    @IBOutlet weak var logoutButton: UIBarButtonItem!
    @IBOutlet weak var LoginButton: UIBarButtonItem!
    @IBOutlet weak var loginInfoLabel: UILabel!
    
    @IBOutlet weak var imagenCollection: UICollectionView!
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImages()
        // Do any additional setup after loading the view.
    }
    func loadImages(){
        images.append(UIImage(named: "image1")!)
        images.append(UIImage(named: "image1")!)
        self.imagenCollection.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.LoginButton.isEnabled = false
            self.logoutButton.isEnabled = true
            self.loginInfoLabel.text = "Hello" + (Auth.auth().currentUser?.email)!
        }else{
            self.LoginButton.isEnabled = true
            self.logoutButton.isEnabled = false
            self.loginInfoLabel.text = "Hello please login"
        }
     }
    
    @IBAction func logoutButtonCliecked(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do{
                try Auth.auth().signOut()
                
                self.LoginButton.isEnabled = true
                self.logoutButton.isEnabled = false
                self.loginInfoLabel.text = "Hello please login "
            } catch let signOunError as NSError {
                print("Error signin out:%@",signOunError)
            }
        }
    }
    func collectionView(_ imageCollection: UICollectionView, numberOfItemsInSection section:Int) -> Int {
        return images.count
    }
    func collectionView(_ imageCollection:UICollectionView,cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
        let image = images[indexPath.row]
        
        cell.imageView.image = image;
        return cell
    }
    
}

