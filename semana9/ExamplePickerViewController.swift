//
//  ExamplePickerViewController.swift
//  semana9
//
//  Created by Linder Hassinger on 6/05/21.
//

import UIKit

class ExamplePickerViewController: UIViewController {
    
    @IBOutlet weak var comicTxtField: UITextField!
    @IBOutlet weak var comicPickerView: UIPickerView!
    
    let comics: [String] = [
        "Flash Point",
        "Invencible",
        "Condorito",
        "Mafalda",
        "Batman vs Superman",
        "Injustice",
        "The Walking Dead"
    ]
    
    let company: [String] = [
        "Marvel",
        "DC",
        "MAD",
        "Warner",
        "Prime Video",
        "Netflix"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPicker()
        setUpTxtField()
    }
    
    func setUpPicker() {
        comicPickerView.delegate = self
        comicPickerView.dataSource = self
        comicPickerView.isHidden = true
    }
    
    func setUpTxtField() {
        comicTxtField.delegate = self
        comicTxtField.inputView = comicPickerView
    }
    
}

extension ExamplePickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return comics.count
        } else {
            return company.count
        }
     
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return comics[row]
        } else {
            return company[row]
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let comicIndex = pickerView.selectedRow(inComponent: 0)
        let companyIndex = pickerView.selectedRow(inComponent: 1)
        
        print(comics[comicIndex])
        print(company[companyIndex])
        
        comicTxtField.text = "\(comics[comicIndex]) => \(company[companyIndex])"

        if component == 1 {
            comicPickerView.isHidden = true
        }
      
    }
    
}

extension ExamplePickerViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        comicPickerView.isHidden = false
        return false
    }
}
