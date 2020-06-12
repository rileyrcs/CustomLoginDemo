//
//  HomeViewController.swift
//  CustomLoginDemo
//
//  Created by Carter Sessions on 6/10/20.
//  Copyright © 2020 Carter Sessions. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var hipHopButton: UIButton!
    @IBOutlet weak var popButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var indieButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.\
        hipHopButton.layer.cornerRadius = 25.0
        popButton.layer.cornerRadius = 25.0
        rockButton.layer.cornerRadius = 25.0
        indieButton.layer.cornerRadius = 25.0
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
