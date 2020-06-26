//
//  FriendListViewController.swift
//  iOS_thirdWeek_Seminar_Exercise
//
//  Created by 양시연 on 2020/06/12.
//  Copyright © 2020 양시연. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController {

    @IBOutlet weak var friendTableView: UITableView!
    @IBOutlet weak var friendCountLabel: UILabel!
    
    
    private var friendsList : [Friend] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setFriendList()
        
        
        friendTableView.delegate = self
        friendTableView.dataSource = self
        
        
    }
    

    @IBAction func touchSettingBtn(_ sender: UIButton) {
        let settingMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let manageFriendAcition = UIAlertAction(title:"친구 관리", style: .default, handler:{ (alert: UIAlertAction!) -> Void in
        })
        let settingAllAcition = UIAlertAction(title:"전체 설정", style: .default, handler:{
            (alert: UIAlertAction!) -> Void in
        })
        let cancleAction = UIAlertAction(title:"취소", style: .cancel, handler:{
            (alert: UIAlertAction!) -> Void in
        })
        
        settingMenu.addAction(manageFriendAcition)
        settingMenu.addAction(settingAllAcition)
        settingMenu.addAction(cancleAction)
        
        self.present(settingMenu, animated: true, completion: nil)
        
    }
    
    
    private func setFriendList(){
        
        let friend1 = Friend(image: "profile1Img", name: "김솝트", message : "왈왈")
        let friend2 = Friend(image: "profile2Img", name: "시튜시튜", message : "")
        let friend3 = Friend(image: "profile3Img", name: "뽀림이", message : "왈왈")
        let friend4 = Friend(image: "profile4Img", name: "이솝트", message : "왈왈")
        let friend5 = Friend(image: "profile5Img", name: "메롱", message : "왈왈")
        let friend6 = Friend(image: "profile6Img", name: "솝트", message : "왈왈")
        let friend7 = Friend(image: "profile7Img", name: "아요 어렵다", message : "왈왈")
        let friend8 = Friend(image: "profile8Img", name: "양솝트", message : "왈왈")
        let friend9 = Friend(image: "profile8Img", name: "박솝트", message : "왈왈")
        let friend10 = Friend(image: "profile8Img", name: "고양이", message : "고양이는 귀여워")
        let friend11 = Friend(image: "profile8Img", name: "흑흑", message : "왈왈")
        let friend12 = Friend(image: "profile8Img", name: "흑흑", message : "왈왈")
        let friend13 = Friend(image: "profile8Img", name: "흑흑", message : "왈왈")
        let friend14 = Friend(image: "profile6Img", name: "솝트", message : "왈왈")
        
        friendsList = [friend1, friend2, friend3, friend4, friend5, friend6, friend7, friend8, friend9, friend10, friend11, friend12, friend13, friend14]
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FriendListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell else {return UITableViewCell()}
        
        friendCell.setFriend(image: friendsList[indexPath.row].profileImage, name: friendsList[indexPath.row].userName, message: friendsList[indexPath.row].message)
        
        return friendCell
    }
    
    // 테이블 뷰 셀 스와이프 해서 삭제 부분
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            // friendList에서 해당 data 삭제 후 table view 업데이트
            friendsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        
            friendCountLabel.text = "친구 \(friendsList.count)"
            // tableView.reloadData()
        }
    }
    
    
    
}

extension FriendListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    
    }
    

}
