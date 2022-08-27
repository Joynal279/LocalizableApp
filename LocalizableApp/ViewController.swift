//
//  ViewController.swift
//  LocalizableApp
//
//  Created by JOYNAL ABEDIN on 27/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - properties
    
    var frenchButton: UIButton!
    var englishButton: UIButton!
    
    var firstNameLabel: UILabel!
    var secondNameLabel: UILabel!
    var departmentLabel: UILabel!
    
    //MARK: - init LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLocalizeInterface()
    }
    
    //MARK: - initial interface setup
    func setupLocalizeInterface(){
        englishButton = UIButton()
        englishButton.frame = CGRect(x: 20, y: 100, width: 100, height: 50)
        englishButton.backgroundColor = .blue
        englishButton.setTitle("English", for: .normal)
        self.view.addSubview(englishButton)
        englishButton.addTarget(self, action: #selector(englishButtonTapped), for: .touchUpInside)
        
        frenchButton = UIButton()
        frenchButton.frame = CGRect(x: self.view.frame.width-120, y: 100, width: 100, height: 50)
        frenchButton.backgroundColor = .gray
        frenchButton.setTitle("French", for: .normal)
        self.view.addSubview(frenchButton)
        frenchButton.addTarget(self, action: #selector(frenchButtonTapped), for: .touchUpInside)
        
        firstNameLabel = UILabel()
        firstNameLabel.frame = CGRect(x: 0, y: 220, width: view.frame.width, height: 30)
        firstNameLabel.textAlignment = .center
        firstNameLabel.text = "Student First name"
        self.view.addSubview(firstNameLabel)
        
        secondNameLabel = UILabel()
        secondNameLabel.frame = CGRect(x: 0, y: 260, width: view.frame.width, height: 30)
        secondNameLabel.textAlignment = .center
        secondNameLabel.text = "Student Last name"
        self.view.addSubview(secondNameLabel)
        
        departmentLabel = UILabel()
        departmentLabel.frame = CGRect(x: 0, y: 300, width: view.frame.width, height: 30)
        departmentLabel.textAlignment = .center
        departmentLabel.text = "Student Department name"
        self.view.addSubview(departmentLabel)
        
    }
    
    @objc
    func englishButtonTapped(){
        print("✅english button Tapped")
        firstNameLabel.text = "firstNameKey".localizableString(local: "en")
        secondNameLabel.text = "lastNameKey".localizableString(local: "en")
        departmentLabel.text = "departmentNameKey".localizableString(local: "en")
    }
    
    @objc
    func frenchButtonTapped(){
        print("✅french button Tapped")
        firstNameLabel.text = "firstNameKey".localizableString(local: "fr")
        secondNameLabel.text = "lastNameKey".localizableString(local: "fr")
        departmentLabel.text = "departmentNameKey".localizableString(local: "fr")
    }
    
    
}

//MARK: - Extension
extension String{
    func localizableString(local: String) -> String {
        let path = Bundle.main.path(forResource: local, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
