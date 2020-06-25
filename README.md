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

