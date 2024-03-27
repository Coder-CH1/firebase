//
//  FirebaseCell.swift
//  firebase
//
//  Created by Mac on 22/03/2024.
//

import UIKit

class FirebaseCell: UICollectionViewCell {
    
    lazy var lable1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var lable2: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var lable3: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(lable1)
        contentView.addSubview(lable2)
        contentView.addSubview(lable3)
        
        NSLayoutConstraint.activate([
            lable1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            lable1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            lable2.topAnchor.constraint(equalTo: lable1.bottomAnchor, constant: 20),
            lable2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            lable3.topAnchor.constraint(equalTo: lable2.bottomAnchor, constant: 20),
            lable3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
    }
    func configure(model: FirebaseDetails) {
        lable1.text = ""
        lable2.text = ""
        lable3.text = ""
        if let aboutMe = model as? AboutMe {
            lable1.text = aboutMe.gender
            lable2.text = aboutMe.name
            lable3.text = aboutMe.stack
        } else if let aboutCountry = model as? AboutCountry {
            lable1.text = aboutCountry.country
            lable2.text = aboutCountry.president
            lable3.text = aboutCountry.race
        } else if let aboutState = model as? AboutState {
            lable1.text = aboutState.gov
            lable2.text = aboutState.state
            lable3.text = aboutState.zone
        } else if let aboutAnimal = model as? AboutAnimal {
            lable1.text = aboutAnimal.animal
            lable2.text = aboutAnimal.color
            lable3.text = aboutAnimal.laptop
        } else if let aboutFruit = model as? AboutFruit {
            lable1.text = aboutFruit.color
            lable2.text = aboutFruit.fruit
            lable3.text = aboutFruit.shape
        } else if let aboutRandom = model as? AboutRandom {
            lable1.text = aboutRandom.firstName
            lable2.text = aboutRandom.phoneBrand
            lable3.text = aboutRandom.socialMedia
        } else if let numOne = model as? AboutNumOne {
            lable1.text = numOne.num1
            lable2.text = numOne.num2
            lable3.text = numOne.num3
        } else if let numTwo = model as? AboutNumTwo {
            lable1.text = numTwo.num4
            lable2.text = numTwo.num5
            lable3.text = numTwo.num6
        } else if let aboutDate = model as? AboutNumThree {
            lable1.text = "\(aboutDate.num9)"
            lable2.text = aboutDate.lastName
            lable3.text = aboutDate.num8
        }
    }
    
}
