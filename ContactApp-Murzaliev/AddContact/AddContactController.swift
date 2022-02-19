//
//  AddContactController.swift
//  ContactApp-Murzaliev
//
//  Created by Samat Murzaliev on 18.02.2022.
//

import UIKit
import SnapKit

class AddContactController: UIViewController {
    
    private var mainDocument = MainDocument()
    
    private var logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.crop.circle.badge.plus")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private var nameField: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.placeholder = "Name"
        view.autocorrectionType = .no
        return view
    }()
    
    private var numberField: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.placeholder = "Number"
        view.autocorrectionType = .no
        view.keyboardType = .phonePad
        return view
    }()
    
    private var addButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Add", for: .normal)
        view.backgroundColor = .blue
        view.tintColor = .white
        view.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        return view
    }()
    
    @objc func addAction() {
        if nameField.text == nil {
            let alert = UIAlertController(title: "Error", message: "Enter name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                print("tapped")
            }))
            present(alert,animated: true)
        }
        
        if numberField.text == nil {
            let alert = UIAlertController(title: "Error", message: "Enter phone number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
                print("tapped")
            }))
            present(alert,animated: true)
        }
        
        mainDocument.saveContact(nameNumber: nameField.text! + " " + numberField.text!)
        mainDocument.updateContacts()
        print(mainDocument.contacts)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setSubViews()
    }
    
    private func setView() {
        view.backgroundColor = .white
    }
    
    private func setSubViews() {
                
        view.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.height.equalTo(view.layer.bounds.height / 3)
            make.width.equalTo(view.layer.bounds.height / 3)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        
        view.addSubview(nameField)
        nameField.snp.makeConstraints { make in
            make.height.equalTo(view.layer.bounds.height / 22)
            make.width.equalTo(view.layer.bounds.width - 80)
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(logoImage.snp.bottom).offset(50)
        }
        
        view.addSubview(numberField)
        numberField.snp.makeConstraints { make in
            make.height.equalTo(view.layer.bounds.height / 22)
            make.width.equalTo(view.layer.bounds.width - 80)
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(nameField.snp.bottom).offset(20)
        }
        
        view.addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.height.equalTo(view.layer.bounds.height / 22)
            make.width.equalTo(view.layer.bounds.width - 80)
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(numberField.snp.bottom).offset(20)
        }
    }
}
