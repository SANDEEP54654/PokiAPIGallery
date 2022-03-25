//
//  ViewController.swift
//  PokiAPIGallery
//
//  Created by Cambrian on 2022-03-21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: OUTLET'S

    @IBOutlet weak var pokeimageCollectionView: UICollectionView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NAV BAR TITLE
        title = "Gallery"
        pokeimageCollectionView.delegate = self
        pokeimageCollectionView.dataSource = self
      
    }


}
//MARK: COLLECTION VIEW DELEGATE DATASOURCE AND FLOW LAYOUT
extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeImagesCollectionViewCell", for: indexPath) as? PokeImagesCollectionViewCell {
           
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

}

