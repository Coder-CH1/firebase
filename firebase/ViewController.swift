//
//  ViewController.swift
//  firebase
//
//  Created by Mac on 22/03/2024.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var data: [FirebaseDetails] = []
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FirebaseCell.self, forCellWithReuseIdentifier: "FirebaseCell")
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchDataFromFirestore()
    }
    
    func setupViews() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    
    func fetchDataFromFirestore() {
        let database = Firestore.firestore()
        var query = database.collection("data")
        query.getDocuments { querySnapshot, error in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                let documents = querySnapshot!.documents
                for document in documents {
                    let modelDict = document.data()
                    if ((modelDict["titleGender"] as? String) != nil) {
                        let aboutMe = AboutMe(document: document)
                        self.data.append(aboutMe)
                    } else if ((modelDict["titleCountry"] as? String) != nil) {
                        let aboutCountry = AboutCountry(document: document)
                        self.data.append(aboutCountry)
                    } else if ((modelDict["titleGovernor"] as? String) != nil) {
                        let aboutState = AboutState(document: document)
                        self.data.append(aboutState)
                    } else if ((modelDict["titleAnimal"] as? String) != nil) {
                        let aboutAnimal = AboutAnimal(document: document)
                        self.data.append(aboutAnimal)
                    } else if ((modelDict["titleFruit"] as? String) != nil) {
                        let aboutFruit = AboutFruit(document: document)
                        self.data.append(aboutFruit)
                    } else if ((modelDict["titlePhoneBrand"] as? String) != nil){
                        let aboutRandom = AboutRandom(document: document)
                        self.data.append(aboutRandom)
                    } else if ((modelDict["num1"] as? String) != nil) {
                        let aboutNum1 = AboutNumOne(document: document)
                        self.data.append(aboutNum1)
                    }else if ((modelDict["num4"] as? String) != nil) {
                        let aboutNum2 = AboutNumTwo(document: document)
                        self.data.append(aboutNum2)
                    }else if ((modelDict["lastName"] as? String) != nil) {
                        let aboutLastName = AboutNumThree(document: document)
                        self.data.append(aboutLastName)
                    }
                }
                self.collectionView.reloadData()
            }
        }
    }
    
}

extension ViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirebaseCell", for: indexPath) as! FirebaseCell
        cell.backgroundColor = .systemPink
        let item = data[indexPath.row]
        cell.configure(model: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == data.count - 1 {
            fetchDataFromFirestore()
        }
    }
    
}
