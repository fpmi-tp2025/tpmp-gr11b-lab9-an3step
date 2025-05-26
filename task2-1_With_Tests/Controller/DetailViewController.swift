//
//  DetailViewController.swift
//  task2-1
//
//  Created by Stepanov on 19.05.25.
//


import UIKit

class DetailViewController: UIViewController {

    var museumItem: MuseumItem!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        imageView.image = museumItem.image
        nameLabel.text = NSLocalizedString(museumItem.name, comment: "")
        descriptionLabel.text = NSLocalizedString(museumItem.description, comment: "")
        historyLabel.text = NSLocalizedString(museumItem.history, comment: "")
    }
}
