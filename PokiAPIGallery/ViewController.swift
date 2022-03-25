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
    
    //MARK: VARIABLE & CONSTANT
    
    var pokeImagesData = [UIImage]()
    
    //margin for colllection view
    
    let margin: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NAV BAR TITLE
        title = "Gallery"
        // set margin and space for two items per row
        guard let collectionView = pokeimageCollectionView, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

            flowLayout.minimumInteritemSpacing = margin
            flowLayout.minimumLineSpacing = margin
            flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        pokeimageCollectionView.delegate = self
        pokeimageCollectionView.dataSource = self
        //load images fom api
        PokeAPIHelper.fetchAllImages { images in
            self.pokeImagesData = images
            self.pokeimageCollectionView.reloadData()
           // self.pokeimage.image = images.first!
        }
    }


}
//MARK: COLLECTION VIEW DELEGATE DATASOURCE AND FLOW LAYOUT
extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokeImagesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeImagesCollectionViewCell", for: indexPath) as? PokeImagesCollectionViewCell {
            cell.pokeImage.image = pokeImagesData[indexPath.row]
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let noOfCellsInRow = 2   //number of column you want
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
    }
    
    
}

