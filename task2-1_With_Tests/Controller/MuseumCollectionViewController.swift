//
//  MuseumCollectionViewController.swift
//  task2-1
//
//  Created by Stepanov on 19.05.25.
//


import UIKit

class MuseumCollectionViewController: UICollectionViewController {

    private var museumItems: [MuseumItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Настройка FlowLayout
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 150, height: 200)
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
        }

        // Загрузка данных из .plist
        museumItems = MuseumDataLoader.loadItems()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return museumItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MuseumCell", for: indexPath) as! MuseumCollectionViewCell
        let item = museumItems[indexPath.row]
        cell.imageView.image = item.image
        cell.titleLabel.text = NSLocalizedString(item.name, comment: "")
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.museumItem = museumItems[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
