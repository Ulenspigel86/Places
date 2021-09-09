//
//  PlaceModel.swift
//  Места
//
//  Created by Ulenspigel on 29.08.2021.
//

import UIKit

struct Place { //для создания модели данных создадим структуру так как у структуры инициализаторы встроены
    
    var name: String //наименование заведения
    var location: String? //месторасположения заведения
    var type: String? //тип заведения
    var image: UIImage? //изображение заведения будет c типом UIImage
    var restaurantImage: String? //иное свойство привязанное к тестовым ячейкам
    
      static let restaurantesNames = ["Burger Heroes","Kitchen","Bonsai","Дастархан","Индокитай","X.O","Балкан Гриль","Sherlock Holmes","Speak Easy","Morris Pub","Вкусные истории","Классик","Love&Life","Шок","Бочка"]//статический массив с наименованиями заведений или любимых мест
    
    static func getPlaces() -> [Place] { //этот массив используется для генерации тестовых записей
        
        var places = [Place]()
        
        for place in restaurantesNames {
            places.append(Place(name: place, location: "Санкт-Петербург", type: "Ресторан", image: nil, restaurantImage: place))
        }
        
        return places
    }
    
}
