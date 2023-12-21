import Foundation
import Alamofire

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNoFound(name: String)
    case fileDecodingFaliled(name: String, Swift.Error)
    case errorRequest(AFError)
}

enum Typefeatch {
    case mock
    case request
}
