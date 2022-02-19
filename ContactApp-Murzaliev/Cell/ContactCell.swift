//
//  ContactCell.swift
//  ContactApp-Murzaliev
//
//  Created by Samat Murzaliev on 18.02.2022.
//

import UIKit
import SnapKit

class ContactCell: UITableViewCell {
    
    var nameNumberLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18, weight: .light)
        view.tintColor = .black
        return view
    }()
    
    override func layoutSubviews() {
        setSubviews()
    }
    
    private func setSubviews() {
        addSubview(nameNumberLabel)
        nameNumberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
    }
    
    func fill(model: CellModel) {
        nameNumberLabel.text = model.nameNumber
    }
}
