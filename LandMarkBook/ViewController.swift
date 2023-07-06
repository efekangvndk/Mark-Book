//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Efekan Güvendik on 27.05.2023.
//

import UIKit
                    //Normalde burada bunlar bulunmaz biz ekliyoruz ki bunlar içinde söz hakkımmız olsun. Pr = protokol...
class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    
    var landmarkNames = [String]() //bunları sınıf içinde tanımlarsak her yerde erişiriz.
    var landmarkImage = [UIImage]()
    var secName = [String]()
    
    //atlama işlemi variable'ları
    var chosenLandmarkNames = ""
    var chosenLandmarkImage = UIImage()
    var chosenSecondName = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bookmark")!)
        

        
        tableView.dataSource = self// bunları da vivdidload a tanımlamaız lazım ki çalışsın.
        tableView.delegate = self
        
        //----VARIABLES
       
        landmarkNames.append("Efekan Güvendik")
        landmarkNames.append("Ebru Taşkınoğlu")///----> string isimler altdakide imagelar.
        landmarkNames.append("Emre Güvendik")
        landmarkNames.append("Asil Taşkınoğlu")
        landmarkNames.append("Ömer F.Akal")
       
        landmarkImage.append(UIImage(named: "efekan")!)
        landmarkImage.append(UIImage(named: "ebru")!)
        landmarkImage.append(UIImage(named: "emre")!)
        landmarkImage.append(UIImage(named: "asil")!)
        landmarkImage.append(UIImage(named: "ömer")!)

        secName.append("Engineer")
        secName.append("Designer")
        secName.append("Engineer")
        secName.append("Desginer")
        secName.append("Engineer")
    }
                              
        
    
    // bu çağırmış olduğumuz 2 func yukarıda yazmış olduğumuz delegate ve datasource yüzündendir.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
        //bu func bizlere kaç girdi olduğunu soruyor. öreneğin buraya return 10 diyip ınt olarak çağırım
    }
    // bu çağırmış olduğumuz 2 func yukarıda yazmış olduğumuz delegate ve datasource yüzündendir.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row] //bu bize row halinde yani sıra ile land..Namesleri gösterir.
        content.secondaryText = secName[indexPath.row] //secText dediğim gibi
        //content.image = landmarkImage[indexPath.row]
        /// eski ve çalışmayan yöntem. (cell.textLabel?.text = "test")
        //bu func ise hicre çağırıyor hücreden kastımızda biz ne verdıysek.
        cell.contentConfiguration = content
    return cell
    }
    
    //bu aşşağıda girmiş olduğumuz func bizlere bir hücre seçildiğinde ne yapmam gerek diye sormaktadır.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkNames = landmarkNames[indexPath.row]
        chosenSecondName = secName[indexPath.row]
        chosenLandmarkImage = landmarkImage[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC" , sender: nil) //bu bize pageler arası geçiş için lazım perfomrsegue ve func.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{ //toDetailsVC yol.
            let destinationsVC = segue.destination as! DetailsVC //DetailsVC ise ekran.
            ///yukarıdaki kodun anlamı =Benim gideceğim bir hedef var ve gideceğim yer DetailsVC
            ///bundan emin olmam lazım çünki gene as! yapıyorum
            destinationsVC.selectedSecondName = chosenSecondName
            destinationsVC.selectedLandmarkImage  = chosenLandmarkImage
            destinationsVC.selectedLandmarkName = chosenLandmarkNames
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { // bu özellik bize sağkaydırma özelliği veriyor.
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImage.remove(at: indexPath.row)
            self.secName.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic )
        }
    }
}
 

