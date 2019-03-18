//
//  ViewController.swift
//  Demo-PlotView
//
//  Created by Valeriy Bezuglyy on 17/03/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    let chartView: LineChartView
    
    init(chart: LineChart) {
        chartView = LineChartView(chart: chart)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .lightGray
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chartView)
        let constr = [chartView.topAnchor.constraint(equalTo: view.topAnchor),
                      chartView.leftAnchor.constraint(equalTo: view.leftAnchor),
                      chartView.rightAnchor.constraint(equalTo: view.rightAnchor),
                      chartView.heightAnchor.constraint(equalToConstant: 400)]
        constr.forEach({ $0.isActive = true })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
