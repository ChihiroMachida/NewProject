//
//  AddViewController.swift
//  NewProject
//
//  Created by 町田千優 on 2017/11/05.
//  Copyright © 2017年 町田千優. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!    //曲名TextField
    @IBOutlet var musicianTextField: UITextField! //作曲者TextField
    @IBOutlet var commentTextField: UITextField!  //コメントTextField
    @IBOutlet var genreTextField: UITextField!    //ジャンルTextFIeld
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func backButton() { //戻るButton
        
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
