//
//  ViewController.swift
//  CollectionView
//
//  Created by Dương Văn Cường on 17/09/2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var tblCollectionView: UICollectionView!
    var list: [Person] = []
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tblCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .red
        cell.layer.cornerRadius = 60
        
        
        return cell
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblCollectionView.dataSource = self
        tblCollectionView.delegate = self
        
        // Do any additional setup after loading the view.
        initData()
        
        
        let screenWith = UIScreen.main.bounds.width
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: screenWith / 3 - 20, height: 120)
        
        tblCollectionView.collectionViewLayout
        = layout
    
    }

    
    func initData(){
//        let personFirst = Person(name: "Duong Cuong", age: "18")
//        list.append(personFirst)
//
//        let personKien = Person(name: "Duong Kien", age: "27")
//        list.append(personKien)
//
//        let personTruong = Person(name: "Duong Truong", age: "33")
//        list.append(personTruong)
//
//        let personLong = Person(name: "Duong Long", age: "18")
//        list.append(personLong)
//
//        let personLanh = Person(name: "Duong Lanh", age: "27")
//        list.append(personLanh)
//
//        let personThuong = Person(name: "Duong Thuong", age: "33")
//        list.append(personThuong)
    }
}

struct Person{
    var name: String
    var age: String
}
