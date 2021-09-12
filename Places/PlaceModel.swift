//
//  PlaceModel.swift
//  Места
//
//  Created by Ulenspigel on 29.08.2021.
//

import RealmSwift//импортируем фремворк БД Realm

class Place: Object { //этот класс наследуется от Object что является элементом библиотеки RealmSwift
    //@objc dynamic var-обьявляется так потому что фремворк RealmSwift предьявляет такие требования к обьявлению свойств
    @objc dynamic var name = "" //так как классы не имеют встроенных инициализаторов то этому свойству присваиваем пустую строку
    @objc dynamic var location: String? //месторасположения заведения
    @objc dynamic var type: String? //тип заведения
    @objc dynamic var imageData: Data? //изображение заведения будет c типом UIImage
    
    
       let restaurantesNames = ["Burger Heroes","Kitchen","Bonsai","Дастархан","Индокитай","X.O","Балкан Гриль","Sherlock Holmes","Speak Easy","Morris Pub","Вкусные истории","Классик","Love&Life","Шок","Бочка"]//статический массив с наименованиями заведений или любимых мест
    
     func savePlaces() { //этот массив используется для генерации тестовых записей
        
        for place in restaurantesNames {
            
        let image = UIImage(named: place)//изображение текущего заведения
            guard let imageData = image?.pngData() else { return }//тут осуществляется перевод свойства image из строкового типа в тип данных
        let newPlace = Place()
        
        newPlace.name = place
        newPlace.location = "Санкт-Петербург"
        newPlace.type = "Ресторан"
        newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)//обращаемся к классу StorageManager, при помощи него мы сохраняем в БД обьект newPlace
            
        }
        
    }

}


