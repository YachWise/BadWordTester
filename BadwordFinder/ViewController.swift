//
//  ViewController.swift
//  BadwordFinder
//
//  Created by Jacob Wise on 2/7/24.
//

import UIKit

class ViewController: UIViewController {
    var words: [String]?

    @IBOutlet weak var usernameTf: UITextField!
    
    @IBOutlet weak var detectedLabel: UILabel!
    
    @IBAction func confirmPressed(sender: UIButton)
    {
        if self.usernameTf.text?.isEmpty == true
        {
            
        }
        else
        {
            let combinedResult = words!.contains(where: self.usernameTf.text!.contains)

            
            if combinedResult == true
            {
                self.detectedLabel.text = "bad word"
            }
            else
            {
                self.detectedLabel.text = "no bad word"
            }
        }
       
    }
    
    
    private func getWords()
    {
        if let wordsJson = Bundle.main.url(forResource: "words", withExtension: "json")
        {
            do
            {
                let data = try Data(contentsOf: wordsJson, options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [String]
                {
                    self.words = jsonResult
                   
                }
            }
            catch
            {
                print("error found")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWords()
        // Do any additional setup after loading the view.
    }


}

