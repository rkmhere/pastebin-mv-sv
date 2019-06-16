//
//  ViewController.swift
//  minval
//
//  Created by Rajkumar Muthusamy on 12/06/19.
//  Copyright © 2019 Rajkumar Muthusamy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
/*    //Image assests
    let images = [UIImage(named: "img1"), UIImage(named: "img2"), UIImage(named: "img3"),  UIImage(named: "img4"), UIImage(named: "img5"),UIImage(named: "img1"), UIImage(named: "img2"), UIImage(named: "img3"),  UIImage(named: "img4"), UIImage(named: "img5")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self

        }
 collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }


}*/
    
    let viewModel = ModelView(client: PastebinClient())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // Init view model
        viewModel.showLoading = {
            if self.viewModel.isLoading {
                self.activityIndicator.startAnimating()
                self.collectionView.alpha = 0.0
            } else {
                self.activityIndicator.stopAnimating()
                self.collectionView.alpha = 1.0
            }
        }
        
        viewModel.showError = { error in
            print(error)
        }
        viewModel.reloadData = {
            self.collectionView.reloadData()
        }
        viewModel.fetchPhotos()
    }
    
    
}
    
    
//Delegate FlowLayout

extension ViewController: PinterestLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
       // let image = images[indexPath.item]
         let image = viewModel.cellViewModels[indexPath.item].image
        let height = image.size.height
        
        return height
    }
    
    
}

//DataSource
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        
       // let image = images[indexPath.item]
        let image = viewModel.cellViewModels[indexPath.item].image
        cell.imageView.image = image
        
        return cell
    }
}
