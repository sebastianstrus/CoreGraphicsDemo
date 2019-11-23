//
//  ViewController.swift
//  CoreGraphicsDemo
//
//  Created by Sebastian Strus on 2019-03-31.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let label1: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "M"
        return label
    }()
    let label2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "M"
        return label
    }()
    let label3: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "M"
        return label
    }()
    let label4: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "M"
        return label
    }()
    let label5: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "M"
        return label
    }()
    let label6: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "M"
        return label
    }()
    let label7: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "M"
        return label
    }()
    
    var stackView: UIStackView!
    
    
    @IBOutlet weak var waterDrunkLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var averageWaterDrunk: UILabel!
    
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var graphView: GraphView!
    
    @IBOutlet weak var plusButton: RoundButton!
    @IBOutlet weak var minusButton: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    func setup() {
        
        stackView = UIStackView(arrangedSubviews: [label1, label2, label3, label4, label5, label6, label7])
        graphView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
    
        view.backgroundColor = UIColor(r: 20, g: 20, b: 20)
        containerView.setAnchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, paddingTop: 80, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 550)
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        counterView.backgroundColor = .clear
        
        counterView.setAnchor(width: 230, height: 230)
        counterView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        counterView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor,constant: 140).isActive = true
        
        graphView.setAnchor(width: 300, height: 250)
        graphView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        graphView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -150).isActive = true
        
        
        
 
        plusButton.setAnchor(width: 100, height: 100)
        plusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60).isActive = true
        plusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 260).isActive = true
        

        minusButton.setAnchor(width: 100, height: 100)
        minusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 60).isActive = true
        minusButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 260).isActive = true
        
        counterLabel.setAnchor(width: 64, height: 64)
        counterLabel.centerXAnchor.constraint(equalTo: counterView.centerXAnchor).isActive = true
        counterLabel.centerYAnchor.constraint(equalTo: counterView.centerYAnchor).isActive = true
        counterLabel.text = String(counterView.counter)
        counterLabel.textColor = UIColor.white//(r: 120, g: 0, b: 0)
        
        waterDrunkLabel.setAnchor(top: graphView.topAnchor,
                                    leading: graphView.leadingAnchor,
                                    bottom: nil,
                                    trailing: nil,
                                    paddingTop: 10,
                                    paddingLeft: 20,
                                    paddingBottom: 0,
                                    paddingRight: 0,
                                    width: 80,
                                    height: 16)
        
        averageLabel.setAnchor(top: waterDrunkLabel.bottomAnchor,
                               leading: graphView.leadingAnchor,
                               bottom: nil,
                               trailing: nil,
                               paddingTop: 0,
                               paddingLeft: 20,
                               paddingBottom: 0,
                               paddingRight: 0,
                               width: 50,
                               height: 16)
        
        averageWaterDrunk.setAnchor(top: waterDrunkLabel.bottomAnchor,
                                    leading: averageLabel.trailingAnchor,
                                    bottom: nil,
                                    trailing: nil,
                                    paddingTop: 0,
                                    paddingLeft: 8,
                                    paddingBottom: 0,
                                    paddingRight: 0,
                                    width: 16,
                                    height: 16)
        
        stackView.setAnchor(top: nil,
                            leading: graphView.leadingAnchor,
                            bottom: graphView.bottomAnchor,
                            trailing: graphView.trailingAnchor,
                            paddingTop: 0,
                            paddingLeft: 8,
                            paddingBottom: 10,
                            paddingRight: 8,
                            width: 0,
                            height: 30)
        
        maxLabel.setAnchor(top: graphView.topAnchor,
                            leading: nil,
                            bottom: nil,
                            trailing: graphView.trailingAnchor,
                            paddingTop: 52,
                            paddingLeft: 0,
                            paddingBottom: 0,
                            paddingRight: 2,
                            width: 16,
                            height: 16)
        
        minLabel.setAnchor(top: nil,
                           leading: nil,
                           bottom: graphView.bottomAnchor,
                           trailing: graphView.trailingAnchor,
                           paddingTop: 0,
                           paddingLeft: 0,
                           paddingBottom: 42,
                           paddingRight: 4,
                           width: 16,
                           height: 16)
        
        
        
    }
    


    
    @IBAction func roundButtonPressed(_ button: RoundButton) {
        if button.isAddButton {
            if counterView.counter < 8 {
                counterView.counter += 1
            }
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
        

        
        // test
        setupGraphDisplay()
    }
    
    func setupGraphDisplay() {
        
        let maxDayIndex = stackView.arrangedSubviews.count - 1
        
        //  1 - replace last day with today's actual data
        graphView.graphPoints[graphView.graphPoints.count - 1] = counterView.counter
        //2 - indicate that the graph needs to be redrawn
        graphView.setNeedsDisplay()
        maxLabel.text = "\(graphView.graphPoints.max()!)"
        
        //  3 - calculate average from graphPoints
        let average = graphView.graphPoints.reduce(0, +) / graphView.graphPoints.count
        averageWaterDrunk.text = "\(average)"
        
        // 4 - setup date formatter and calendar
        let today = Date()
        let calendar = Calendar.current
        
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEEE")
        
        // 5 - set up the day name labels with correct days
        for i in 0...maxDayIndex {
            if let date = calendar.date(byAdding: .day, value: -i, to: today),
                let label = stackView.arrangedSubviews[maxDayIndex - i] as? UILabel {
                label.text = formatter.string(from: date)
            }
        }
    }

}

