//
//  Resultado.swift
//  Carpools
//
//  Created by Jorge on 11/16/16.
//  Copyright © 2016 Jorge. All rights reserved.
//


import UIKit
import Firebase

class Resultado: UITableViewController {
    
    let ref = FIRDatabase.database().reference()
    var postal = ""
    var estudiantes: [Estudiante] = []
//    let tap = UITapGestureRecognizer(target: self, action: Selector("callNumber:"))
 
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTitle.title = postal
        tableView.allowsMultipleSelectionDuringEditing = false
        ref.observe(.childAdded, with: { snapshot in
            if(snapshot.key == self.postal){
                var nuevosEstudiantes : [Estudiante] = []
                for item in snapshot.children{
                    let estudiante = Estudiante(snapshot: item as! FIRDataSnapshot)
                    nuevosEstudiantes.append(estudiante)
                }
                self.estudiantes = nuevosEstudiantes
                self.tableView.reloadData()
                
//                print("\(snapshot.key):\n\(snapshot.value!)")
            }
        })
        

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return estudiantes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let estudiante = estudiantes[indexPath.row]
        
        cell.textLabel?.text = estudiante.nombre
        cell.detailTextLabel?.text = estudiante.celular
        cell.detailTextLabel?.textColor = UIColor.blue
//        cell.detailTextLabel?.addGestureRecognizer(tap)
        
        //cell.detailTextLabel?.tag = Int(estudiante.celular)!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
   
//    func callNumber(sender:UITapGestureRecognizer) {
//        let phoneNumber = sender.view?.tag
//        print(phoneNumber)
//        print("will call number above")
//        if let phoneCallURL:NSURL = NSURL(string:"tel://\(phoneNumber)") {
//            let application:UIApplication = UIApplication.shared
//            if (application.canOpenURL(phoneCallURL as URL)) {
//                application.openURL(phoneCallURL as URL);
//            }
//        }
//    }
    
//    func createCallButton(tel: String){
//        let button = UIButton(type: .system) // let preferred over var here
//        button.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
//        button.setTitle(tel, for: [])
//        button.addTarget(self, action: #selector(callNumber(phoneNumber: tel)), for: UIControlEvents.touchUpInside)
//        self.view.addSubview(button)
//    }
}






