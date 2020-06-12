//
//  AccountViewController.swift
//  CustomLoginDemo
//
//  Created by Carter Sessions on 6/12/20.
//  Copyright © 2020 Carter Sessions. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    var finalName = ""
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = finalName
        
        // Do any additional setup after loading the view.
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
