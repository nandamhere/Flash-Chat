//
//  ViewController.swift
//  Flash Chat
//
//  Created by Vaibhav Nandam on 7/12/18.
//  Copyright © 2018 Vaibhav Nandam. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    
  
    
    // Declare instance variables here

    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set yourself as the delegate and datasource here:
        
        messageTableView.dataSource = self
        messageTableView.delegate = self
        
        //TODO: Set yourself as the delegate of the text field here:
        
        messageTextfield.delegate = self

        
        
        //TODO: Set the tapGesture here:
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        

        //TODO: Register your MessageCell.xib file here:
        
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")

        configureTableView()
        
        
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: cellForRowAtIndexPath :
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        let messageArray = ["first message", "second message", "third message"]
        cell.messageBody.text = messageArray[indexPath.row]
        return cell
        
    }
    
    
    
    
    //TODO: Declare numberOfRowsInSection here:
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    
    //TODO: Declare tableViewTapped here:
    
    @objc func tableViewTapped() {
       messageTextfield.endEditing(true)
        
    }
    
    
    
    //TODO: Declare configureTableView here:
    
    func configureTableView() {
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 100
    }
    
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    

    
    //TODO: Declare textFieldDidBeginEditing here:
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    
    
    //TODO: Declare textFieldDidEndEditing here:
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }
    

    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
   //TODO: Send the message to Firebase and save it in our database
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        let messageDB = Database.database().reference().child("Messages")
        let messageDictionary = ["Sender" : Auth.auth().currentUser?.email , "Message" : messageTextfield.text!]
        messageDB.childByAutoId().setValue(messageDictionary){
            (error, reference) in
        }
    }
    
    //TODO: Create the retrieveMessages method here:
    
    
    

    
    //TODO: Log out the user and send them back to WelcomeViewController
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        do {
            
            try Auth.auth().signOut()
            print("sucessfully loggedout")
            navigationController?.popToRootViewController(animated: true)
        }
        catch {
            print(error)
        }
        
        
    }
    


}
