//
//  ViewController.swift
//  DummyJsonUserApi
//
//  Created by Mac on 03/04/17.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.delegate = self
        userTableView.dataSource = self
         registerCells()
         jsonParser()
    }
    func registerCells(){
        let uinib = UINib(nibName: "UserTableViewCell", bundle: nil)
        self.userTableView.register(uinib, forCellReuseIdentifier: "UserTableViewCell")
    }
    func jsonParser(){
        let urslstring = "https://dummyjson.com/users"
        let url = URL(string: urslstring)
        var urlrequest = URLRequest(url: url!)
        urlrequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlrequest){data,response,error in
            print(String(data: data!, encoding: .utf8)!)
            print(response)
            let jsonDecoder = JSONDecoder()
            let root : Root = try! jsonDecoder.decode(Root.self, from: data!)
            self.users = root.users
            DispatchQueue.main.async {
                self.userTableView.reloadData()
            }
            
        }.resume()

    }

}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.userTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.fnameLabel.text = users[indexPath.row].firstName + " " +  users[indexPath.row].lastName
        cell.phoneLabel.text = "Phone.No : \(users[indexPath.row].phone)"
        cell.emailLabel.text = users[indexPath.row].email
        let urlstring = users[indexPath.row].image
        let url = URL(string: urlstring)
        cell.img.sd_setImage(with: url)
        cell.layer.borderWidth = 3
        cell.layer.cornerRadius = 15
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailVC.user = users[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
