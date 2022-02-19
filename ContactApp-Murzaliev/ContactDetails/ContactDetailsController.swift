//
//  ContactDetailsController.swift
//  ContactApp-Murzaliev
//
//  Created by Samat Murzaliev on 19.02.2022.
//

import UIKit
import SnapKit

class ContactDetailsController: UIViewController {
    
    private var logoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.crop.circle.badge.plus")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var nameLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 22, weight: .medium)
        view.textColor = .black
//        view.text = "1231231231"
        return view
    }()

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
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(view.layer.bounds.height / 22)
            make.width.equalTo(view.layer.bounds.width - 80)
            make.left.equalToSuperview().offset(50)
            make.top.equalTo(logoImage.snp.bottom).offset(50)
        }
    }
    
    func fill(nameNumber: String) {
        nameLabel.text = nameNumber
    }
}
