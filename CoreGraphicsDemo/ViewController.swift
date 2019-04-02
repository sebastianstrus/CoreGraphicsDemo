//
//  ViewController.swift
//  CoreGraphicsDemo
//
//  Created by Sebastian Strus on 2019-03-31.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var plusButton: PlusButton!
    
    @IBOutlet weak var counterView: CounterView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        
        plusButton.addTarget(self, action: #selector(handlePress), for: .touchUpInside)
        plusButton.backgroundColor = UIColor.red
        setup()
    }

    func setup() {
        counterView.setAnchor(width: 230, height: 230)
        counterView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        counterView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        
        
        plusButton.setAnchor(width: 100, height: 100)
        plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        plusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func handlePress() {
        print("Button pressed.")
    }

}

