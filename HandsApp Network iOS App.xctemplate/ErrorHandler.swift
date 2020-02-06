import Foundation

class ErrorHandler {
    var messagesView: UserMessagesView?

    func handle(error: Error) {
        let message = error.localizedDescription
        messagesView?.showErrorAlert(withMessage: message)
    }
}
