import Foundation

protocol Runnable { }

// MARK: - Default implementation

extension Runnable {
    func run(_ closure: (Self) -> Void) {
        closure(self)
    }
}

// MARK: - NSObject + Runnable

extension NSObject: Runnable { }
