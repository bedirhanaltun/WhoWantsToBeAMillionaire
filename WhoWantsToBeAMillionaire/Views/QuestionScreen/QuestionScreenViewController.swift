//
//  QuestionScreenViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bedirhan Altun on 24.10.2022.
//

import UIKit

protocol QuestionScreenViewProtocol: AnyObject {
    func reloadTableView()
}

class QuestionScreenViewController: UIViewController {

    private let questionViewModel = QuestionViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        questionViewModel.view = self
        questionViewModel.viewDidLoad()


        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

    @IBOutlet weak var tableView: UITableView!
    
}

extension QuestionScreenViewController: QuestionScreenViewProtocol {
    
    func reloadTableView() {
        tableView.reloadOnMainThread()
    }
}

extension QuestionScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionViewModel.questionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = questionViewModel.questionsList[indexPath.row].question
        return cell!
    }
    
    
    
    
}
