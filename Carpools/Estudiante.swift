//
//  Estudiante.swift
//  Carpools
//
//  Created by Jorge on 11/16/16.
//  Copyright © 2016 Jorge. All rights reserved.
//

import Foundation
import Firebase

struct Estudiante {
    
    let nombre:String
    let celular:String
    let key: String
    let ref: FIRDatabaseReference?
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        nombre = snapshotValue["Nombre"] as! String
        celular = snapshotValue["Celular"] as! String
        ref = snapshot.ref
    }
}
