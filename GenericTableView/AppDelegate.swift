//
//  AppDelegate.swift
//  GenericTableView
//
//  Created by Denis Litvin on 24.07.2018.
//  Copyright © 2018 Denis Litvin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        window?.rootViewController = PeopleController()
        
        
        return true
    }
    
    // Model / ViewModel
    struct Person {
        let firstName, lastName: String
    }
    
    // View
    class PersonCell: GenericCell<Person> {
        override var item: Person! {
            didSet {
                textLabel?.text = "\(item.firstName) \(item.lastName)"
            }
        }
    }
    
    // Controller
    class PeopleController: GenericTableViewController<PersonCell> {
        override func viewDidLoad() {
            super.viewDidLoad()
            items = [Person(firstName: "Bill", lastName: "Clinton"),
                     Person(firstName: "Barack", lastName: "Obama"),
                     Person(firstName: "Donald", lastName: "Trump")]
        }
    }
    
    
}

