# YangSiYeon
양시연


## 1차 과제
### 1️⃣ Navigation 활용 화면 이동 
* 실행화면 

![1차과제_네비게이션](https://user-images.githubusercontent.com/37260938/85427366-9ebbbb00-b5b6-11ea-9b28-51cf69e5c750.gif)

📝 개발 과정

얘는 별다른 코드가 없기 때문에 개발과정을 글로 표현하겠다.
1) View Controller 추가
2) 추가한 View Controller를 선택한 상태에서 Xcode 상단의 Editor - Embed In - Navigation Controller를 클릭
3) 버튼을 추가하고, 이 버튼을 눌렀을 때 이동할 View Controller를 하나 더 추가
4) 화면 전환을 push로 설정하면 버튼을 눌렀을 때 화면 전환이 일어난다!

### 2️⃣ 로그인 화면 구현 
* 실행화면 

![1차과제_로그인](https://user-images.githubusercontent.com/37260938/85431543-a8e0b800-b5bc-11ea-9307-73097c82dab2.gif)

📝 개발 과정
* LoginViewController

HomeViewController에서 이메일과 비밀번호를 화면에 띄워줘야 하기 때문에 emailTextField의 값과 passwordTextField의 값을 전달한다.
그리고 LoginVC -> HomeVC는 present 형태로 전환을 하기 때문에 코드로 전환해주고,
LoginVC -> SignupVC는 push 형태로 전환을 하기 때문에 스토리 보드상에서 간단하게 전환을 설정해 줄 수 있다.


```swift
    @IBAction func trasferData(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "homeViewController") as? HomeViewController else { return }
               
        receiveViewController.email = emailTextField.text
        receiveViewController.password = passwordTextField.text
              
        receiveViewController.modalPresentationStyle = .fullScreen
        
        self.present(receiveViewController, animated: true, completion: nil)
    }

```


* SignupViewController

LoginViewController의 transferData와 똑같다. (근데 왜 두개 이름을 이렇게 지었지? 함수명 짓는 규칙도 생각해봐야겠다.)

```swift
@IBAction func didTouchSignupComplete(_ sender: Any) {
        
        guard let receiveViewController = self.storyboard?.instantiateViewController(identifier: "homeViewController") as? HomeViewController else { return }
               
            receiveViewController.email = emailTextField.text
            receiveViewController.password = passwordTextField.text
              
        receiveViewController.modalPresentationStyle = .fullScreen
        
        self.present(receiveViewController, animated: true, completion: nil)
        
    }
```

* HomeViewController

setLabels()라는 함수에서 다른 ViewController에서 받아온 email과 password 라벨의 값을 초기화 시켜준다.

```swift
    var email: String?
    var password: String?
    
    private func setLabels(){
        // Optional Binding
        // guard let은 optional을 깨서 확인을 하려고 하는 것
        guard let email = self.email else { return }
        guard let password = self.password else { return }
       
        // Label에 값 대입
        emailLabel.text = email
        passwordLabel.text = password
    }
```

또한, 아래와 같은 코드로 로그아웃 버튼을 누르면 LoginVC로 이동시켜준다.


```swift
@IBAction func backScreen(_ sender: Any) {
    
        let navigationController = self.presentingViewController as? UINavigationController

        self.dismiss(animated: true) {
            let _ = navigationController?.popToRootViewController(animated: true)
        }
    }
```


## 2차 과제
### 1️⃣ StackView로 계산기 만들기
* 실행화면

<img width="376" alt="2차과졔_계산기" src="https://user-images.githubusercontent.com/37260938/85612528-f11ed980-b693-11ea-9300-e48bd2d75bbf.png">

📝 개발 과정
1) 1개의 Vertical Stack View를 만들고, 그 안에 4개의 Horizontal Stack View를 집어 넣는다.
2) 여기서 쓰이는 Stack View는 모두 안의 버튼이 같은 크기를 가지고 있고, 같은 간격으로 띄워져 있기 때문에 distribution을 fill equally로 준다.
3) spacing을 적당히 준다.
4) 버튼이 정사각형이 되게 하려면 spacing을 잘 고려해서 Vertical Stack View의 height를 설정해주어야 한다.
5) 버튼에 radius를 주기 위해서 다음과 같은 코드를 작성한다.

```swift
acBtn.layer.cornerRadius = 0.5 * acBtn.bounds.size.width
```

### 2️⃣ 제플린에 따라 화면 구현하기
* 실행화면

![2차과제_스크롤](https://user-images.githubusercontent.com/37260938/85613648-0f390980-b695-11ea-8ada-7b3c590723a4.gif)


📝 개발 과정
1) Scroll View를 추가해준다.
2) Scroll View 안에 콘텐츠들을 담을 View를 추가하고, Scroll View의 Content Layout Guide에 constraint 값을 준다. (콘텐츠를 담을 View는 주로 Content View라고 부르는 것 같다.)
3) 이 화면은 세로로 스크롤 되므로 Scroll View의 Frame Layout Guide의 Width를 Conent View의 width와 같게 해준다.
4) Image View를 추가하고, 아래의 콘텐츠들은 계산기 과제와 똑같이 Stack View와 CornerRadius를 이용해서 구현한다.
5) 아래 콘텐츠를 다 구현했으면 Scroll View 바로 밑의 View에 23의 constraint값을 주면서 Scroll View의 크기를 알려준다. (중요⭐️)


## 3차 과제
* 실행화면 

![3차과제](https://user-images.githubusercontent.com/37260938/85789842-42999800-b76a-11ea-8b74-28759f007120.gif)

### 1️⃣ Tabbar Controller를 활용한 화면 이동
📝 개발 과정
1) 먼저 View Controller를 생성하고 Tab Bar Controller를 Embed in 또는 relationship segue 시켜준다.
2) 똑똑한 Xcode가 알아서 탭바를 만들어주면 ViewController의 Tab Bar Item에서 선택되었을 때 이미지와 기본 이미지(선택 안되었을 때 이미지)를 선택해준다.

<img width="260" alt="스크린샷 2020-06-26 오전 5 04 57" src="https://user-images.githubusercontent.com/37260938/85790083-9dcb8a80-b76a-11ea-87ce-abc842d44912.png">

3) 기본적으로 제공되는 이미지를 이용하면 색이 파란색이다. 이때, Tab Bar Item의 색상을 바꿔주기 위해서는 Tab Bar Controller에서 Image Tint 색상을 바꿔주어야 한다.

<img width="257" alt="스크린샷 2020-06-26 오전 5 09 29" src="https://user-images.githubusercontent.com/37260938/85790465-37933780-b76b-11ea-9746-b7324ce357d6.png">

### 2️⃣ Table View로 화면 구성하기

다른 iOS 파트원들은 제일 상단의 내 정보 부분을 섹션을 나눠서 또 다른 Table View Cell로 처리했던데,, 안드로이드에 익숙해서 그런지 그런 생각을 전!혀! 하지 못했다.
"어차피 하나 나오는 뷰니까~ 고냥 View로 감싸서 박자~" 라고 생각했다. 나 자신 반성,, 그래서 뷰 구조가 아래와 같다.

<img width="232" alt="스크린샷 2020-06-26 오전 5 10 54" src="https://user-images.githubusercontent.com/37260938/85790733-b12b2580-b76b-11ea-8f12-d9935d76c53d.png">

📝 개발 과정
1) 스토리보드에 뷰를 그린다.
2) ViewController에 FriendListViewController.swift 파일을 연결한다. 이 소스코드에서 중요한 부분은 다음과 같다.

👉 데이터를 뿌려주기 위해서 더미 데이터 리스트를 만들고 viewDidLoad() 함수에서 불러준다. (하드코딩된 부분이 많으므로 생략!)
👉 Table View의 이벤트를 대신 처리해 줄 객체를 지정한다.
```swift
 override func viewDidLoad() {
        super.viewDidLoad()
        
        setFriendList()
        
        friendTableView.delegate = self
        friendTableView.dataSource = self
        
    }
```
👉 Table View에 들어갈 값에 대한 정의와 이벤트를 아래와 같이 구현한다.

각 함수가 하는 일은 위에서 부터 차례대로 Table Cell의 개수 return, Table Cell 설정, Table Cell 1개의 높이 지정 이다.

```swift
extension FriendListViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell else {return UITableViewCell()}
        
        friendCell.setFriend(image: friendsList[indexPath.row].profileImage, name: friendsList[indexPath.row].userName, message: friendsList[indexPath.row].message)
        
        return friendCell
    }
}

extension FriendListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    
    }
}
```


3) 자 바로 위 코드에 있는 friendCell이란 무엇인가! 바로 Table View Cell에 대한 설정을 하기 위해 소스코드가 하나 더 필요하다. 나는 FriendCell.swift 라는 이름으로 파일을 하나 만들어 주었다.

👉 스토리보드에서 Table View Cell을 선택하고 Custom Class로 FriendCell을 지정해준다. 

👉 또한 Identifier도 설정해준다.

<img width="259" alt="스크린샷 2020-06-26 오전 5 29 38" src="https://user-images.githubusercontent.com/37260938/85792157-09632700-b76e-11ea-8b35-68df680478f3.png">

👉 FriendCell.swift에서는 Table View Cell의 아울렛들을 가져와서 이름을 지어주고, 이들을 설정하는 코드를 작성해준다.

```swift
import UIKit

class FriendCell: UITableViewCell {

    static let identifier: String = "FriendCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFriend(image: String, name: String, message: String?){
    
        profileImageView.image = UIImage(named: image)
        nameLabel.text = name
        messageLabel.text = message
    }
}
```

### 3️⃣ (도전 과제) Table View Cell 왼쪽으로 밀어서 삭제하기
도전 과제 치고는 생각보다 쉽게 해결할 수 있었다.

📝 개발 과정
Table View에 들어갈 값에 대한 정의를 해주는 extension 객체에 다음과 같은 일을 추가한다.

1) 우선 canEditRowAt이 들어있는 함수에서 true를 반환하여 row를 편집할 수 있도록 한다.

```swift
func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
}
```
2) 아래와 같은 함수로 tableView를 edit할 때 일어나는 일을 구현한다.

해당 코드는 tableView에서 삭제가 일어날 때 tableView에 뿌려지는 friendList에서 삭제할 데이터를 없애고 tableView를 업데이트하는 코드이다. tableView 업데이트 후엔 상단에 위치한 친구의 수를 나타낸 label의 text를 friendList의 사이즈로 바꿔준다. 

💡 가장아래에 있는 tableView.reloadData()를 이용하면 위에서 어떤 일을 한 다음에 tableView를 새로 로드해서 뷰가 새로 그려지게 된다. 하지만 이 코드를 사용하면 그냥 뷰가 다시 그려지는 것이기 때문에 내가 삭제한 셀이 없어진건지 파악하기가 어렵고, 개인적으로 iOS의 장점이라고 생각하는 예쁜 애니메이션도 없다. 그래서 구글링을 통해 더 찾아본 결과 deleteRows()라는 함수를 사용하면 실제로 tableView의 indexPath에 위치한 row를 지웠다고 알려주고 이에 맞는 애니메이션도 예쁘게 생긴다! (ㅎㅎ 뿌듯)

```swift
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            // friendList에서 해당 data 삭제 후 table view 업데이트
            friendsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        
            friendCountLabel.text = "친구 \(friendsList.count)"
            // tableView.reloadData()
        }
    }
```

### 4️⃣ (도전 과제) 설정 버튼 누르면 하단에서 Action Sheet 뜨게 하기
📝 개발 과정

1) 세팅 버튼을 클릭 IBAction 함수를 만든다.
2) UIAlertController 객체를 만들고 preferredStyle은 actionSheet로 지정해준다.
3) UIAlertAction 객체를 만들어주고 UIAlertController에 달아준다.
4) UIAlertController를 present로 띄워준다!

💡  밑에서 올라오는 애는 Action Sheet이고 가운데에 빡 뜨는 애는 Alert이다. Alert 형태로 띄우고 싶으면 preferredStyle을 alert로 지정해주면 된다. alert는 말그대로 경고창 같은 것이기 때문에 선택지가 1개인 경우에 주로 사용한다!

```swift
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
```





