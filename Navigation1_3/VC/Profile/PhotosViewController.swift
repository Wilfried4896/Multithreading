//
//  PhotosViewController.swift
//  Navigation1_3
//
//  Created by Вилфриэд Оди on 17.06.2022.
//

import UIKit
import StorageService
import iOSIntPackage

class PhotosViewController: UIViewController {

    private let photoGalery: [PhotoGame] = Photo.shared.imageData
    private var galery = [UIImage]()
    
    private let imageGalery = Photo.iamgesGalery()
    let imagePublisherFacade = ImagePublisherFacade()
    
    private enum ConstantInterval {
        static let instant: CGFloat = 3
    }

    private lazy var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        let photosCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photosCollection.delegate = self
        photosCollection.dataSource = self
        photosCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        photosCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Default")
        photosCollection.translatesAutoresizingMaskIntoConstraints = false
        return photosCollection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpphotosCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        imagePublisherFacade.removeSubscription(for: self)
        imagePublisherFacade.rechargeImageLibrary()
    }
    
    private func setUpphotosCollection() {
        navigationItem.title = "Photos Gallery"
        view.addSubview(photosCollectionView)
        
        imagePublisherFacade.subscribe(self)
        imagePublisherFacade.addImagesWithTimer(time: 0.5, repeat: imageGalery.count, userImages: imageGalery)

        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galery.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellGalery = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as? PhotosCollectionViewCell else {
            let cellDefault = collectionView.dequeueReusableCell(withReuseIdentifier: "Default", for: indexPath)
            return cellDefault
        }

//        let album = galery[indexPath.row]
        cellGalery.setUpPhoto(photo: galery[indexPath.item])
        return cellGalery
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        let inset = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero

        let needWidth = collectionView.bounds.width - (ConstantInterval.instant - 1)  * spacing - inset.left - inset.right
        let itemWight = floor(needWidth / ConstantInterval.instant)

        return CGSize(width: itemWight, height: itemWight)
    }
}


extension PhotosViewController: ImageLibrarySubscriber {
    
    func receive(images: [UIImage]) {
        galery = images
        photosCollectionView.reloadData()
    }
}
