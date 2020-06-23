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
