//
//  ViewController.swift
//  lab3
//
//  Created by ІПЗ-31/1 on 19.09.2025.
//

import UIKit
class apartment{
    var balcony : Bool = false
    var name : String = ""
    var type : String = ""
    init(balcony: Bool, name: String, type: String) {
        self.balcony = balcony
        self.name = name
        self.type = type
    }
    func info() {
        print("Name: \(name) , Balcony \(balcony) , Type \(type)")
    }
}

class ViewController: UIViewController {
    @IBOutlet var picker: UIPickerView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var balcony: UISwitch!
    
    let data = ["One Bedroom", "Two Bedroom", "Studio"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        // Do any additional setup after loading the view.
        
    }
   
    @IBAction func confirm(_ sender: Any) {
        var ap = apartment(balcony: balcony.isOn, name: textField.text ?? "none", type: data[picker.selectedRow(inComponent: 0)])
        
        ap.info()
    }

}
    extension ViewController: UIPickerViewDataSource{
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return data.count
        }
    }
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}

