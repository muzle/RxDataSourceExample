import Foundation

public final class AnyEventTracker<Event>: EventTrackerType {
    
    // MARK: - Private properties
    
    private let completion: (Event) -> Void
    
    // MARK: - Initialization
    
    public init(_ completion: @escaping (Event) -> Void) {
        self.completion = completion
    }
    
    public init<EventTracker: EventTrackerType>(_ eventTracker: EventTracker) where EventTracker.Event == Event {
        completion = eventTracker.handle(event:)
    }
    
    // MARK: - Protocol methods
    
    public func handle(event: Event) {
        completion(event)
    }
}
