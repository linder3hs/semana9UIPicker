//
//  ViewController.swift
//  semana9
//
//  Created by Linder Hassinger on 6/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countryPickerView: UIPickerView!
    
    @IBOutlet weak var animePickerView: UIPickerView!
    
    @IBOutlet weak var anineLbl: UILabel!
    
    @IBOutlet weak var countryLbl: UILabel!
    
    let countries : [String] = [
        "Peru",
        "Colombia",
        "Chile",
        "Argentina",
        "Bolivia"
    ]
    
    let animes = [
        "Naruto",
        "DBZ",
        "Boku no piko",
        "Dr Stone",
        "Gantz",
        "Clannad"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPickerCountry()
        setUpPickerAnime()
    }
    
    func setUpPickerCountry() {
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        anineLbl.text = animes[0]
    }
    
    func setUpPickerAnime() {
        animePickerView.delegate = self
        animePickerView.dataSource = self
        countryLbl.text = countries[0]
    }
    
}

extension ViewController:  UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Numero de columnas
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Numero de elementos
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == countryPickerView {
            return countries.count
        } else {
            return animes.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == countryPickerView {
            return countries[row]
        } else {
            return animes[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == countryPickerView {
            countryLbl.text = countries[row]
        } else {
            anineLbl.text = animes[row]
        }
    }
    
}

