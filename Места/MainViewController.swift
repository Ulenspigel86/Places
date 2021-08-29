//
//  MainViewController.swift
//  Места
//
//  Created by Ulenspigel on 23.08.2021.
//

import UIKit


class MainViewController: UITableViewController {
    
    let restaurantesNames = ["Burger Heroes","Kitchen","Bonsai","Дастархан","Индокитай","X.O","Балкан Гриль","Sherlock Holmes","Speak Easy","Morris Pub","Вкусные истории","Классик","Love&Life","Шок","Бочка"]//статический массив с наименованиями заведений или любимых мест

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantesNames.count//возвращем сюда все компонеты вышеуказанного массива
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = restaurantesNames[indexPath.row]//выводим весь список заведений из массива
        cell.imageView?.image = UIImage(named: restaurantesNames[indexPath.row])//добовляем изображения в ячейки
        cell.imageView?.layer.cornerRadius = cell.frame.size.height / 2//скругляем углы ячейки, радиус равен половине высоты ячейки, но само изображение в ячейке не скругляется
        cell.imageView?.clipsToBounds = true //тут мы скругляем углы самого изображенияя находящегося в ячейке

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85 //возвращаем нужный нам размер ячейки
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
