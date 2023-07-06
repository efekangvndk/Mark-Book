//
//  DetailsVC.swift
//  LandMarkBook
//
//  Created by Efekan Güvendik on 27.05.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landmarLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var secondName: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    var selectedSecondName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "rainbow")!)
        landmarLabel.text = selectedLandmarkName
        ImageView.image = selectedLandmarkImage
        secondName.text = selectedSecondName
    }
    

    

}
