

import Alamofire

class NetworkManager: SessionManager {
    
    // MARK: - Singleton instance
    static let shared: Alamofire.SessionManager = {
    
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        
        return sessionManager
    }()
}
