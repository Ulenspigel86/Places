//
//  MainViewController.swift
//  Места
//
//  Created by Ulenspigel on 23.08.2021.
//

import UIKit


class MainViewController: UITableViewController {
    

    
    var places = Place.getPlaces()//обратимся к структуре Place и к ее методу getPlaces

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count//возвращем сюда все компонеты вышеуказанного массива
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell //этот класс наследуется от класса CustomTableViewCell с его аутлетами
        
        let place = places[indexPath.row]

        cell.nameLabel.text = place.name//выводим весь список заведений из массива
        cell.locationLabel.text = place.location//элемент ячейки отвечающий за местрорасположения заведения
        cell.typeLabel.text = place.type//элемент ячейки отвечающий за тип заведения
        
        if place.image == nil {
            cell.imageOfPlace.image = UIImage(named: place.restaurantImage!)//добовляем изображения в ячейки
        } else {
            cell.imageOfPlace.image = place.image
        }
        
        
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2//скругляем углы ячейки, радиус равен половине высоты ячейки, но само изображение в ячейке не скругляется
        cell.imageOfPlace.clipsToBounds = true //тут мы скругляем углы самого изображенияя находящегося в ячейке

        return cell
    }
    
//    // MARK: - Table view delegate
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        #imageLiteral(resourceName: "simulator_screenshot_64708BC6-0DDD-4066-946B-AC944B8DAA1E.png")
//        return 85 //возвращаем нужный нам размер ячейки
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        
        newPlaceVC.saveNewplace()
        places.append(newPlaceVC.newPlace!)
        tableView.reloadData()//обновляем интерфейс
    }
    

}
