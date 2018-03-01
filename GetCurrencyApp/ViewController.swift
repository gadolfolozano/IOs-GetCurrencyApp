//
//  ViewController.swift
//  GetCurrencyApp
//
//  Created by Adolfo Lozano Mendez on 28/02/18.
//  Copyright © 2018 Adolfo Lozano Mendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var mSearchBar: UISearchBar!
    @IBOutlet weak var mTxtUsdCurrency: UILabel!
    @IBOutlet weak var mTxtCanCurrency: UILabel!
    @IBOutlet weak var mTxtPenCurrency: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mSearchBar.delegate = self
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(mSearchBar.text!)
    }

}

