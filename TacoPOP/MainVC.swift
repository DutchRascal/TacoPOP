//
//  MainVC.swift
//  TacoPOP
//
//  Created by Andre Boevink on 11/02/2017.
//  Copyright © 2017 Andre Boevink. All rights reserved.
//

import UIKit

class MainVC: UIViewController, DataServiceDelegate {

    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataService: DataService = DataService.instance

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataService.delegate = self
        dataService.loadDeliciousTacoData()
        dataService.tacoArray.shuffle()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        headerView.addDropShadow()
        
        /*
        let nib = UINib(nibName: "TacoCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "TacoCell")
        */
        
        collectionView.register(TacoCell.self)
    }
    
    func deliciousTacoDataLoaded() {
        
//        print("Delicious Taco Data Loaded!")
        
        collectionView.reloadData()
    }

}

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.tacoArray.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TacoCell", for: indexPath) as? TacoCell {
//            cell.configureCell(taco: dataService.tacoArray[indexPath.row])
//            return cell
//        }
//        return UICollectionViewCell()
        
        let cell = collectionView.dequeReuasbleCell(forIndexPath: indexPath) as TacoCell
        cell.configureCell(taco: dataService.tacoArray[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TacoCell {
            cell.shake()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 95)
    }
    
}
