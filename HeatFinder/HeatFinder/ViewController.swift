//
//  ViewController.swift
//  HeatFinder
//
//  Created by Utley, Lawrence on 4/23/18.
//  Copyright © 2018 Utley, Lawrence. All rights reserved.
//

import UIKit
import MapKit

class Global{
    var shop = String()
}
let global = Global()

struct Shops :Decodable {
    let id: Int
    let city: String
    let name: String
    let address: String
}


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var myFavorites: UITextView!
    
    
    @IBOutlet weak var picker: UIPickerView!
    let pickerData = ["Austin", "San Antonio", "San Marcos"]
    var chosenCity = "Austin"


    override func viewWillAppear(_ animated: Bool) {
        myFavorites.text = global.shop
        let selection = global.shop
        //myFavorites.text = "You picked \(yrShop!):\n"
        
        // url for json file. Must be https and hosted on a secure server. Change the location to your json file on your server
        
        let json = "http://json.lawtutley.com/shops.json"
        
        // guard statements protect the app if there is no response
        guard let url = URL(string: json)
            else { return }
        
        // this area sets up a urlsession with the json
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data
                else { return }
            
            // use do, try, catch to deal with errors
            do {
                
                // JSONDecoder decodes json array
                let events = try JSONDecoder().decode([Shops].self, from: data)
                //enumerated adds the index to the array
                for (i, shops) in events.enumerated() {
                    if(shops.name == selection) {
                        //must use this to change the ui element outside of the urlsession. Use of += to append to the TextView
                        DispatchQueue.main.sync {
                            self.myFavorites.text! = ("\(shops.name) \(shops.address) \n")
                        }
                    }
                }
            }
                
            catch let jsonErr {
                print("Error", jsonErr)
            }
            }.resume()

        
    }
    override func viewDidLoad() {
        


        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func continueButtonPressed(_ sender: Any) {self.performSegue(withIdentifier: "\(chosenCity)Segue", sender: nil)
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    //Called when the user changes the selection...
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosenCity = pickerData[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }

  
}

