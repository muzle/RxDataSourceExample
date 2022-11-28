import RxSwift
import RxCocoa

enum ButtonsSceneUnit: UnitType {
    struct Input {
        
    }
    
    struct Output {
        let dataSource: Driver<AnyAnimatableSections>
    }
}
