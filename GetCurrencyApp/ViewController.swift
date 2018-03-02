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
        getCurrency(currency: mSearchBar.text!)
        mSearchBar.text = ""
    }
    
    func getCurrency(currency: String) {
        
        let url = URL(string: "http://api.fixer.io/latest?base=\(currency)")
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
                if data != nil {
                    
                    do {
                        
                        let jSONResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, AnyObject>
                        
                        DispatchQueue.main.async {
                            print(jSONResult)
                            
                            let rates = jSONResult["rates"] as! [String : AnyObject]
                            
                            let usd = String(describing: rates["USD"]!)
                            self.mTxtUsdCurrency.text = "USD: \(usd)"
                            
                            let cad = String(describing: rates["CAD"]!)
                            self.mTxtCanCurrency.text = "CAD: \(cad)"
                            
                            let chf = String(describing: rates["BRL"]!)
                            self.mTxtPenCurrency.text = "CHF: \(chf)"
                            
                            
                        }
                        
                        
                    } catch {
                        
                    }
                    
                    
                    
                }
                
            }
            
        }
        task.resume()
        
    }

}

