import Foundation
import RxSwift
import RxCocoa

final class OneButtonViewModel: ViewModelType {
    
    // MARK: - Types
    
    typealias Unit = OneButtonUnit
    typealias EventTracker = Unit.EventTracker
    
    struct Configuration {
        let title, buttonTitle: String?
    }
    
    // MARK: - Private properties
    
    private let configuration: Configuration
    private let eventTracker: EventTracker
    
    // MARK: - Initialization
    
    init(
        configuration: Configuration,
        eventTracker: EventTracker
    ) {
        self.configuration = configuration
        self.eventTracker = eventTracker
    }
    
    // MARK: - Protocol methods
    
    func transform(input: Unit.Input) -> Unit.Output {
        let event = input.first
            .map { Unit.Event.first }
            .track(with: eventTracker)
        
        return Unit.Output(
            title: .just(configuration.title),
            buttonTitle: .just(configuration.buttonTitle),
            empty: event
        )
    }
}
