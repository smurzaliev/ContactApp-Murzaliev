//
//  ViewController.swift
//  ContactApp-Murzaliev
//
//  Created by Samat Murzaliev on 16.02.2022.
//

import UIKit
import SnapKit

class MainController: UIViewController {
    
    private var document = MainDocument()
    
    private lazy var contactsTable: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(ContactCell.self, forCellReuseIdentifier: "ContactCell")
        view.separatorColor = .black
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setSubViews()
        document.updateContacts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        document.updateContacts()
        contactsTable.reloadData()
    }
    
    private func setView() {
        navigationItem.title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addAction))
    }
    
    private func setSubViews() {
        view.addSubview(contactsTable)
        contactsTable.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func addAction(view: UIButton) {
        navigationController?.pushViewController(AddContactController(), animated: true)
    }
}

extension MainController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return document.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        cell.nameNumberLabel.text = document.contacts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ContactDetailsController(), animated: true)
        let destVC = ContactDetailsController()
        destVC.fill(nameNumber: document.contacts[indexPath.row])
    }
}
