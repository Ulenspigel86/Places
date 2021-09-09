//
//  NewPlaceViewController.swift
//  Места
//
//  Created by Ulenspigel on 29.08.2021.
//

import UIKit

class NewPlaceViewController: UITableViewController {//этот класс необходим для работы с клавиатурой на экране созлания нового места
    
    var newPlace: Place? //обьявляем экземпляр структуры Place
    var imageIsChanged = false //своство отвечающее за замену изображения на тот случай если пользователь не выбрал свое
    

    @IBOutlet weak var saveButton: UIBarButtonItem!//аутлет для кнопки Save
    
    @IBOutlet weak var placeImage: UIImageView!//этот аутлет связан с имеджвью
    @IBOutlet weak var placeName: UITextField!//аутлет для поля плейснэйм
    @IBOutlet weak var placeLocation: UITextField!//аутлет для поля расположение места
    @IBOutlet weak var placeType: UITextField!//аутлет тип заведения
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()//убираем лишнюю разлиновку с низу
        
        saveButton.isEnabled = false//доступность кнопки Save
        
        placeName.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)//отслеживаем поле placeName и его изменение на заполнение и вызывает метод textFieldChanged - этот метод следит за заполнением поля
    }
    
 //MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//скрываем клавиатуру по тапу ячеек всех кроме содержащей имеджвью
        
        if indexPath.row == 0 {
            let cameraIcon = #imageLiteral(resourceName: "camera") //констата относится к изображению экшен шита камеры
            let photoIcon = #imageLiteral(resourceName: "photo") //констата относится к изображению экшен шита выбор фото из медиатеки
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)//создаем свойство отвечающее за алерт контроллер
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in //пользовательское действие работа с камерой
                self.chooseImagePicker(source: .camera)//TODO: chooseImagePicker тут будет метод работающий с камерой
            }
            camera.setValue(cameraIcon, forKey: "image")//обращаемся к обьекту камера чтобы привязать к нему изображение камеры экшеншита
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")//размещаем текст экшеншита с лева
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in //пользовательское действие работа с фото
                self.chooseImagePicker(source: .photoLibrary)//TODO: chooseImagePicker тут будет метод работающий с фото
            }
            photo.setValue(photoIcon, forKey: "image")//обращаемся к обьекту фото из беблиотеки чтобы привязать к нему изображение фото экшеншита
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")//размещаем текст экшеншита с лева
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) //пользовательское действие отмены
            
            //вписываем вышеуказанные пользовательские действия в Алертконтроллер
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)//тут вызываем Алертконтроллер
                
} else {
            view.endEditing(true)
        }
    }

    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)//при нажатии кнопки Cancel вызывается этот метод
    }
    
}

// MARK: Text field delegate

extension NewPlaceViewController: UITextFieldDelegate { //скрытие клавиатуры по нажатию кнопки Done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() { //в этом методе мы следим заполнено ли поле placeName
        
        if placeName.text?.isEmpty == false {//если поле не пустое то кнопка Save активна
            saveButton.isEnabled = true //при заполненном поле кнопка активна
        } else {
            saveButton.isEnabled = false //при пустом поле кнопка не активна
        }
    }
    
    func saveNewplace(){ //обработка действий кнопки Save при заполнении 3-х полей все заполненные данные должны быть переданы в свойства модели данных структуры Place
        
        var image: UIImage?
        
        if imageIsChanged {
            image = placeImage.image
        } else {
            image = #imageLiteral(resourceName: "imagePlaceholder") //картинка на тот случай когда пользователь не выбрал свое изображение
        }
        
        newPlace = Place(name: placeName.text!, location: placeLocation.text!, type: placeType.text!, image: image, restaurantImage: nil)//параметры структуры Place тут в них передаются соответствующие значения
    }
    
    
}

//для работы с логикой пользовательских действий создадим следующие расширения

//MARK: Work with image

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {//это расширение предназначено для работы с изображениями в этом классе и UIImagePickerControllerDelegate подписан под это расширение
    
    func chooseImagePicker(source: UIImagePickerController.SourceType){ //UIImagePickerController отвечает за работу с медиатекой камерой и фото
        
        if UIImagePickerController.isSourceTypeAvailable(source){//проверяем доступность ресурса откуда будем брать файлы
            let imagePicker = UIImagePickerController()//создаем экземпляр класса NewPlaceViewController
            imagePicker.delegate = self//назначаем делегата imagePickerController им будет являться сам класс NewPlaceViewController
            imagePicker.allowsEditing = true //imagePicker является вьюконтроллером
            imagePicker.sourceType = source
            present(imagePicker, animated: true)//отображаем на экране imagePicker
        }
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {//этот метод делегирует UIImagePickerController
        
        placeImage.image = info[.editedImage] as? UIImage//тут мы привязываем изображение к имеджвю
        placeImage.contentMode = .scaleAspectFill //тут редактируется само загруженное изображение посредством масштабирования
        placeImage.clipsToBounds = true//обрезка по границам изображения
        
        imageIsChanged = true //если пользватель поставил свою картинку то она не меняется
        
        dismiss(animated: true)//закрываем имеджпикерконтроллер
    }
    
}
