import UIKit
import Firebase
import RxSwift

class SigInPresenterImpl: SigInPresenter  {
  
  weak var view: SigInView!
  var userRepository: UserRepository
  private let disposeBag = DisposeBag()
  
  init(view: SigInView, userRepository: UserRepository ) {
    self.view = view
    self.userRepository = userRepository
  }
  
  func sigInPresenter(email: String, password: String) {
    
//    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
//      if error == nil {
//        self.view.sigInPass()
//        self.userRepository.fetchUserDefaut(uid: (user?.user.uid)!)
//      }
//      else {
//        self.view.sigInFail()
//      }
//    }
    self.userRepository.fetchUserDefautRx(email: email, password: password)
      .subscribe(onNext: { (snapshot) in
        let user = User(snapshot: snapshot)
        guard let userEmail = user?.name else {return}
        guard let userName = user?.name else {return}
        // MARK: - save local
        let defaults = UserDefaults.standard
        defaults.set(userEmail, forKey: IDUserDefault.keyEmail)
        defaults.set(userName, forKey: IDUserDefault.KeyName)
      }, onError: { (error) in
        self.view.sigInFail()
      }, onCompleted: {
        self.view.sigInPass()
        print("succes")
      })
      .disposed(by: disposeBag)
  }
}

