//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Артем Хребтов on 14.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTF: UITextField!
    @IBOutlet weak var mounthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLable: UILabel!
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dataTF.text, let month = mounthTF.text, let year = yearTF.text else {return}
        
        let calendar = Calendar.current
        var dayComponents = DateComponents()
        dayComponents.day = Int(day)
        dayComponents.month = Int(month)
        dayComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dayComponents) else {return}
        let weekDay = dateFormatter.string(from: date)
        let capWeekDay = weekDay.capitalized
        
        resultLable.text = capWeekDay
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

