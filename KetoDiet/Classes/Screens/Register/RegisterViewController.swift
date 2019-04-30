//
//  RegisterViewController.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 21/03/2019.
//  Copyright © 2019 MacBook. All rights reserved.
//

import UIKit
import ARSLineProgress

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let models: [HeaderModel] = [.info, .sex, .birthday]
    private var registerModel = RegisterModel() 
    private var sexModels: [Sex] = [.male, .female]
    
    private let datePickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.maximumDate = Date()
        return picker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        delegating()
        title = "Регистрация"
        Decorator.decorate(vc: self)
        configureDatePickerView()
        addRightBarButton()
        updateDoneButtonStatus()
        // Do any additional setup after loading the view.
    }
    
    private func addRightBarButton() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(rightBarButtonClicked))
        navigationItem.rightBarButtonItem = barButton
    }
    
    
    private func updateDoneButtonStatus() {
        navigationItem.rightBarButtonItem?.isEnabled = registerModel.isFilled
    }
    
    @objc private func rightBarButtonClicked(sender: UIBarButtonItem) {
        ARSLineProgress.show()
        AuthManager.shared.register(with: registerModel) { result in
            ARSLineProgress.hide()
            switch result {
            case .success(_):
                StartRouter.shared.routeAfterSuccessAuth(from: self)
                SecureStorageManager.shared.save(email: self.registerModel.email, password: self.registerModel.password) { (error) in
                    if let error = error {
                        print(String(describing: error.errorDescription))
                    }
                }
            case .failure(let error):
                self.showAlert(with: "Ошибка", and: error.localizedDescription)
            }
        }
    }
    
    private func configureDatePickerView() {
        datePickerView.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
    }
    
    @objc private func datePickerChanged(sender: UIDatePicker) {
        let date = sender.date
        registerModel.birthday = date
        updateDoneButtonStatus()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    private func photoViewClicked() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    private func delegating() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerCells() {
        tableView.register(UserInfoTableViewCell.nib, forCellReuseIdentifier: UserInfoTableViewCell.name)
        tableView.register(SegmentTableViewCell.nib, forCellReuseIdentifier: SegmentTableViewCell.name)
        tableView.register(TextTableViewCell.nib, forCellReuseIdentifier: TextTableViewCell.name)
        tableView.register(TextFieldTableViewCell.nib, forCellReuseIdentifier: TextFieldTableViewCell.name)
        
    }
}
extension RegisterViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        registerModel.photo = image
        updateDoneButtonStatus()
        tableView.reloadData()
        ARSLineProgress.show()
        StorageManager.shared.upload(photo: image, by: registerModel) {
            ARSLineProgress.hide()
        }
    }
}
    
    
    extension RegisterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = models[indexPath.section].cellModels[indexPath.row]
        switch model {
        case .userInfo:
            return 100
        case .sex, .birthday:
            return 44
        default:
            return 0
        }
    }
    
}

extension RegisterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerModel = models[section]
        switch headerModel {
        case .sex:
            let view = HeaderTitleView.loadFromNib()
            view.set(title: "Ваш пол:")
            return view
        default:
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerModel = models[section]
        switch headerModel {
        case .sex, .birthday, .info:
            return 44
        default: return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].cellModels[indexPath.row]
        switch model {
        case .userInfo:
            if let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.name, for: indexPath) as? UserInfoTableViewCell {
                cell.topTextChanged = {
                    text in
                    self.registerModel.email = text
                    self.updateDoneButtonStatus()
                }
                cell.bottomTextChanged = {
                    text in
                    self.registerModel.password = text
                    self.updateDoneButtonStatus()
                }
                cell.photoViewClicked = self.photoViewClicked
                cell.set(image: registerModel.photo)
                return cell
            }
        case .sex:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SegmentTableViewCell.name, for: indexPath) as? SegmentTableViewCell {
                cell.set(titles: sexModels.map{$0.rawValue.capitalized})
                cell.indexChanged = {
                    index in
                    let sex = self.sexModels[index]
                    self.registerModel.sex = sex
                    self.updateDoneButtonStatus()
                }
                return cell
            }
        case .birthday:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.name, for: indexPath) as? TextFieldTableViewCell {
                cell.textField.inputView = datePickerView
                return cell
            }
            
        default: break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].cellModels.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
}
extension RegisterViewController {
    private static let tableViewTopInset: CGFloat = 16
    fileprivate class Decorator {
        static func decorate(vc: RegisterViewController) {
            vc.tableView.separatorColor = .clear
            vc.tableView.keyboardDismissMode = .onDrag
            vc.tableView.backgroundColor = .white
            vc.navigationController?.navigationBar.makeClear()
            vc.navigationController?.navigationBar.prefersLargeTitles = true
            vc.tableView.contentInset = UIEdgeInsets(top: tableViewTopInset, left: 0, bottom: 0, right: 0)
        }
    }
}

extension RegisterViewController {
    
    fileprivate enum CellModel {
        case userInfo
        case sex
        case birthday
    }
    
    fileprivate enum HeaderModel: CellHeaderProtocol {
        
        typealias CellType = CellModel
        case sex
        case info
        case birthday
        
        var cellModels: [RegisterViewController.CellModel] {
            switch self {
            case .sex: return [.sex]
            case .info: return [.userInfo]
            case .birthday: return [.birthday]
            }
        }
        
        
    }
}








