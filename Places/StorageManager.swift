//
//  StorageManager.swift
//  Places
//
//  Created by Ulenspigel on 12.09.2021.
//

import RealmSwift

let realm = try! Realm()//cоздаем специальный обьект позволяющий работать с бд и который даст доступ для работы с БД и он обьявлен как глобальная переменная

class StorageManager { //этот класс предназначен для работы с БД
    
    static func saveObject (_ place: Place) {//метод сохраняющий обьекты в БД
        
        try! realm.write { //экземпляр realm является базой данных или точкой входа в БД
            realm.add(place)//тут в БД добавляется нужный обьект, в данном сдучае place
        }
        
    }
    
}

