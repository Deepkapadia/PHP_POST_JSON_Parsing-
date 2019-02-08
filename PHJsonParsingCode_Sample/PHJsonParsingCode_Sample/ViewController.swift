//
//  ViewController.swift
//  PHJsonParsingCode_Sample
//
//  Created by DeEp KapaDia on 21/01/19.
//  Copyright © 2019 DeEp KapaDia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var id_Tct: UITextField!
    
    @IBOutlet weak var Name_Txt: UITextField!
    
    @IBOutlet weak var Pass_Text: UITextField!
    
    @IBOutlet weak var Table: UITableView!
    
    var arr:[Any] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       DisplayData()
        
    }
    
    @IBAction func Select(_ sender: Any) {
        
          self.DisplayData()
        
    }
    
    
    func DisplayData(){
        
        let url2 = URL(string: "http://localhost/PasswordSaver/select.php")
        let urlrq1 = URLRequest(url: url2!)
        let ssn1 = URLSession.shared
        
        let datatask1 = ssn1.dataTask(with: urlrq1, completionHandler: {
            (data3,resp3, err3) in
            
            do
            {
                self.arr = try JSONSerialization.jsonObject(with: data3!, options: [] ) as! [[String:String]]
                
                DispatchQueue.main.async {
                    
                    print(self.arr)
                    
                    self.Table.reloadData()
                    
                }
                
            }
            catch
            {
                
            }
            
        })
        datatask1.resume()
    }
    
    @IBAction func Insert_BTN(_ sender: Any) {
        
        let str = "http://localhost/PasswordSaver/insert_post.php";
        let strbody = "name=\(Name_Txt.text!)&password=\(Pass_Text.text!)"
        
        let url = URL(string: str)
        
        var request = URLRequest(url: url!)
        
        let strlen = strbody.count
        
        let bodydata = strbody.data(using: String.Encoding.utf8)
        
        request.httpBody = bodydata
        
        request.httpMethod = "POST"
        
        request.addValue(String(strlen), forHTTPHeaderField: "Content-Length")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: {(data1,res,err) in
            
            let result = String(data : data1!, encoding:String.Encoding.utf8)
            
            print(result!)
            DispatchQueue.main.async {
                
                self.DisplayData()
                self.Table.reloadData()
            }
          
        })
        task.resume()
    }
    
    @IBAction func Update_BTN(_ sender: Any) {
        
        let str = "http://localhost/PasswordSaver/update_post.php"
        let strbody = "id=\(id_Tct.text!)&name=\(Name_Txt.text!)&password=\(Pass_Text.text!)"

        let url = URL(string: str)
        
        var request = URLRequest(url: url!)
        
        let strlen = strbody.count
        
        let bodydata = strbody.data(using: String.Encoding.utf8)
    
        request.httpBody = bodydata
        
        request.httpMethod = "POST"
        
        request.addValue(String(strlen), forHTTPHeaderField: "Content-Length")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: {(data1,res,err) in
            
            let result = String(data : data1!, encoding:String.Encoding.utf8)
            
            print(result!)
            
            DispatchQueue.main.async {
                
                self.DisplayData()
                
            }
        })
        task.resume()
    }
    
    @IBAction func Delete_BTN(_ sender: Any) {
        
        let str = "http://localhost/PasswordSaver/delete_post.php"
        let strbody = "id=\(id_Tct.text!)"
        
        let url = URL(string: str)
        
        var request = URLRequest(url: url!)
        
        let strlen = strbody.count
        
        let bodydata = strbody.data(using: String.Encoding.utf8)
        
        request.httpBody = bodydata
        
        request.httpMethod = "POST"
        
        request.addValue(String(strlen), forHTTPHeaderField: "Content-Length")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: {(data1,res,err) in
            
            let result = String(data : data1!, encoding:String.Encoding.utf8)
            
            print(result!)
            
            DispatchQueue.main.async {
                
                self.DisplayData()
                self.Table.reloadData()
            }
        })
        task.resume()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CellFile

        let dic = arr[indexPath.row] as! [String:Any]
        
        cell.id.text = dic["id"] as? String
        cell.name.text = dic["name"] as? String
        cell.pass.text = dic["password"] as? String

        return cell
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

