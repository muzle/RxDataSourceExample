import Foundation
import RxSwift
import RxCocoa

final class ButtonsSceneModel: ViewModelType {
    
    // MARK: - Types
    
    typealias Unit = ButtonsSceneUnit
    
}

// MARK: - ViewModelType

extension ButtonsSceneModel {
    func transform(input: Unit.Input) -> Unit.Output {
        let dataSource = input.update
            .asDriver(onErrorDriveWith: .empty())
            .map(makeRandomDataSource)
            .startWith(makeRandomDataSource())
        
        return Unit.Output(
            dataSource: dataSource
        )
    }
}

// MARK: - Private methods

private extension ButtonsSceneModel {
    
    enum CellType: CaseIterable {
        case one, two, three
    }
    
    func makeRandomDataSource() -> AnyAnimatableSections {
        (0...countOfSections()).map(makeRandomSection(sectionIndex:))
    }
    
    func makeRandomSection(sectionIndex: Int) -> AnyAnimatableSection {
        let items = (0...countOfItems()).map { _ in makeRandomAnimatedItem() }
        return AnyAnimatableSection(
            header: "It's \(sectionIndex) section",
            items: items
        )
    }
    
    func makeRandomAnimatedItem() -> AnyAnimatableItem {
        let type = CellType.allCases.randomElement()!
        
        switch type {
        case .one:
            let model = makeOneButtonModel()
            let item = AnimatableItem<TableViewWrapperCell<OneButtonView>>(
                identity: UUID().uuidString,
                viewModel: model
            )
            return item.asAnyAnimatableItem()
        case .two:
            let model = makeTwoButtonModel()
            let item = AnimatableItem<TableViewWrapperCell<TwoButtonView>>(
                identity: UUID().uuidString,
                viewModel: model
            )
            return item.asAnyAnimatableItem()
        case .three:
            let model = makeThreeButtonModel()
            let item = AnimatableItem<TableViewWrapperCell<ThreeButtonView>>(
                identity: UUID().uuidString,
                viewModel: model
            )
            return item.asAnyAnimatableItem()
        }
    }
    
    func makeOneButtonModel() -> OneButtonUnit.ViewModel {
        let title = makeRandomTitle()
        let config = OneButtonViewModel.Configuration(
            title: title,
            buttonTitle: "title"
        )
        let router = OneButtonViewModel.EventTracker { event in
            print("event: \(event) in \(title) cell")
        }
        let model = OneButtonViewModel(
            configuration: config,
            eventTracker: router
        )
        return model.asAnyViewModel()
    }
    
    func makeTwoButtonModel() -> TwoButtonUnit.ViewModel {
        let title = makeRandomTitle()
        let config = TwoButtonViewModel.Configuration(
            title: title,
            firstButtonTitle: "title 1",
            secondButtonTitle: "title 2"
        )
        let router = TwoButtonViewModel.EventTracker { event in
            print("event: \(event) in \(title) cell")
        }
        let model = TwoButtonViewModel(
            configuration: config,
            eventTracker: router
        )
        return model.asAnyViewModel()
    }
    
    func makeThreeButtonModel() -> ThreeButtonUnit.ViewModel {
        let title = makeRandomTitle()
        let config = ThreeButtonViewModel.Configuration(
            title: title,
            firstButtonTitle: "title 1",
            secondButtonTitle: "title 2",
            thirdButtonTitle: "title 3"
        )
        let router = ThreeButtonViewModel.EventTracker { event in
            print("event: \(event) in \(title) cell")
        }
        let model = ThreeButtonViewModel(
            configuration: config,
            eventTracker: router
        )
        return model.asAnyViewModel()
    }
    
    func makeRandomTitle() -> String {
        UUID().uuidString
    }
    
    func countOfSections() -> Int {
        (2...4).randomElement()!
    }
    
    func countOfItems() -> Int {
        (5...12).randomElement()!
    }
}
