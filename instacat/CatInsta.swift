//
//  CatInsta.swift
//  instacat
//
//  Created by Piero Rado on 11/21/19.
//  Copyright © 2019 Piero Rado. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct CatInsta {
    let  key:String!
    let url:String!
    
    let itemRef:DatabaseReference?
    
    init(url:String, key:String) {
        self.key = key
        self.url = url
        self.itemRef = nil
    }
    
    init(snapshot:DataSnapshot) {
        key = snapshot.key
        itemRef = snapshot.ref
        
        let snapshotValue = snapshot.value as? NSDictionary
        
        if let imageUrl = snapshotValue?["url"] as? String{
            url = imageUrl
        }else{
            url = ""
        }
    }
}
